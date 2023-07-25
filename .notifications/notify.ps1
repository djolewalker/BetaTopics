$Commits = $env:COMMITS | ConvertFrom-Json;
$Author = $env:AUTHOR;
$VisitUrl = $env:VISIT_URL

$Sections = @();
$Commits | ForEach-Object {
  $Section = @{
    widgets = @(); 
  };
  
  $i = 0;
  $Message = $_.message;
  $Message.Split([Environment]::NewLine) | ForEach-Object { 
    if ($i -eq 0) {
      if ($_ -like "dev:*") {
        $Section.isDevelopment = $True;
      }
      $Section.header = $_;
    }
    elseif ($i -gt 1) {
      $Widget = @{
        textParagraph = @{
          text = $_;
        }
      }
      $Section.widgets += $Widget; 
    }

    $i += 1;
  };

  if (!$Section.isDevelopment) {
    $Sections += $Section;
  }
} 

if ($Sections.Length -eq 0) {
  Write-Output "There are no articles to share with google chat groups!";
  return;
}

$ButtonsSections = $(
  @{
    widgets = @( 
      @{
        buttonList = @{
          buttons = @(
            @{
              text    = "Take a look ➡️";
              onClick = @{
                openLink = @{
                  url = $VisitUrl;
                }
              }
            }
          )
        }
      }); 
  }
);

$CardsV2 = @{
  cardsV2 = @(
    @{
      card = @{
        header   = @{
          title = "$Author shared articles 🎉🎉🎉";
        };
        sections = $Sections + $ButtonsSections;
      }
    }
  )
};

$Headers = @{ 
  "Content-Type" = "application/json"
};
$Body = ($CardsV2 | ConvertTo-Json -Depth 20);
$BodyBytes = [System.Text.Encoding]::UTF8.GetBytes($Body);

$Response = Invoke-WebRequest -H $Headers -Method POST -Body $BodyBytes -Uri $env:GOOGLE_CHAT_HOOK -UseBasicParsing;

$StatusCode = $Response | Select-Object -Expand StatusCode
if ($StatusCode -eq 200) {
  Write-Output "Google chat group has been notified successfully!";
}
else {
  Write-Output "Something went wrong, can't trigger notification!";
  return 1;
}