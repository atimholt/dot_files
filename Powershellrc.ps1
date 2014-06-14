# Tim Holt's Powershell profile.
# Created in 2011 and heavily modified continuosly since then.
#
# This file is full of ‘*’ command ‘links’ __in_this_format. Maybe.
#
# Free to use for anyone


#│-v-1 │ To-Do's  
#└─────┴─────────
# TODO   Protect the Wide-Use Variables from editing!
# TODO   Put machine-dependant variables into the local machine's profile,
#        including paths to installed programs (with 'if' checks on whether
#        something is defined before messing with). Don't forget to put template
#        code in this file's comments!

#│-v-1 │ Set-Up
#└─┬───┴─┬──────
  #│-v-2 │ Wide-Use Variables
  #└─────┴────────────────────
    $computer_name = get-content env:computername

    $desktop_name = "TIMWIN8DESKTOP"
    $old_desktop_name = "BAGEND"
    #$laptop_name = "atimh_000-PC"
    $laptop_name = "TIMHOLT-PC"

    $all_winPCs_list = @($old_desktop_name, $laptop_name, $desktop_name)

    $on_laptop = ($computer_name -eq $laptop_name)
    $on_desktop = ($computer_name -eq $desktop_name)
    $on_either_machine = ( $all_winPCs_list -contains $computer_name )

    $progfilesx86 = ""
    $progfiles_manual = ""
    $all_progfiles = ""
    if ($on_desktop)
    {
      $progfilesx86 = ${env:ProgramFiles(x86)}

      $progfiles_manual = "C:\Program Files (Manually Installed)\"

      $all_progfiles = @($env:ProgramW6432, $progfilesx86, $progfiles_manual)
    }
    elseif ($on_laptop)
    {
      $progfilesx86 = $env:ProgramFiles

      $progfiles_manual = "C:\Program Files, Manually Installed\"

      $all_progfiles = @($progfilesx86, $progfiles_manual)
    }
    
    if ($on_either_machine)
    {
      # Paths that happen to be the same!
      $zzd = "~/localcode/zzd_meta/zig_zag_dungeon/"
      $dropbox = "C:\Users\atimh_000\Dropbox\"
      $tempmine = "C:\Users\atimh_000\temp\"

      $office = $progfilesx86 + "Microsoft Office\Office12\"
      $minecraft_hidden = "C:\Users\atimh_000\AppData\Roaming\.minecraft"

      $my_scripts = "~\Dropbox\PowerShellScripts\"
    }

    # Utility variables:
    $cpp_files = @("*.h", "*.cpp", "*.hpp")
    $vim_runtime = "C:\Users\atimh_000\Dropbox\Vim\GlobalRuntimePath\"
      # Resultant files of the "hg merge [branch] -t internal:dump" command.
    $dump_files = @("*.base", "*.local", "*.orig", "*.other")

    # cmdlet default parameters
    $ls_x = @{"Exclude" = ".*"}

  #│-v-2 │ Path Augmentation
  #└─────┴───────────────────
    # Note, this method of path augmentation goes away when powershell closes!
    if ($on_desktop)
    {
      #$env:path = $env:path + ";C:\Program Files (x86)\Vim\vim74"
      $env:path = $env:path + ";C:\Program Files (Manually Installed)\doxys_1_15_win_bin"
      $env:path = $env:path + ";C:\MinGW\bin"
      $env:path = $env:path + ";C:\Program Files\MiKTeX 2.9\miktex\bin\x64"
    }
    elseif ($on_laptop)
    {
      $env:path = $env:path + ";C:\Program Files\Vim\vim73\"
      $env:path = $env:path + ";C:\Program Files\TortoiseHg"
      $env:path = $env:path + ";C:\Program Files\SlikSvn\bin\"
      $env:path = $env:path + ";C:\MinGW\bin"
    }

    if ( $on_either_machine )
    {
      $env:path = $env:path + ";" + $home + "\Dropbox\PowerShellScripts\"
      $env:path = $env:path + ";C:\Program Files\7-Zip\"
      # $env:path = $env:path + ";" + $progfiles_manual + "doxys\"
    }

  #│-v-2 │ Import Modules
  #└─────┴────────────────
    if ( $on_either_machine )
    {
      Import-Module Pscx
    }

#│-v-1 │ Utility
#└─┬───┴─┬───────
  #│-v-2 │ Aliases & Utility Functions
  #└─┬───┴─┬───────────────────────────
    #│-v-3 │ Aliases
    #└─────┴─────────
      Set-Alias v gvim

      Set-Alias p. Push-Location
      Set-Alias p Pop-Location

      # (Defined in next section:)
      Set-Alias p.s getlocationstack
      Set-Alias b battery

      Set-Alias _7z 7z

      Set-Alias Python2 C:\Python27\python.exe

      Set-Alias Python3 C:\Python34\python.exe

      # Set-Alias c++ x86_64-w64-mingw32-c++
      # Set-Alias g++ x86_64-w64-mingw32-g++

      if ($on_either_machine)
      {
        set-alias say out-speech
      }

    #│-v-3 │ Utility Functions
    #└─────┴───────────────────
      function list_path
      {
        $a = $env:path; $a.Split(";")
      }

      function getlocationstack
      {
        Get-Location -Stack
      }

      function lds
      {
        if ( $on_either_machine )
        {
          C:\Program` Files\Intellectual` Reserve\LDS` View` 7.1\wcUView.exe
        }
      }

      # Run vim without a swap file.
      function vn
      {
        invoke-expression $("gvim -n")
      }

      function minecraft
      {
        if ( $on_desktop )
        {
          invoke-expression $("javaw -Xmx2048m -Xms1024m -jar `"C:\Program Files, manually installed\MineCraft\Minecraft.exe`"")
        }
        else
        {
          echo "You haven't set this up for this machine."
        }
      }

      function word
      {
        if ( $on_either_machine )
        {
          & ($office + "WINWORD.EXE")
        }
      }

      function hp([string]$topic)
      {
        # TODO: Find a Vim filetype spec for powershell help output
        invoke-expression $("get-help -full {0} | v -R -" -f $topic)
      }

      function hpf([string]$topic)
      {
        # TODO: Find a Vim filetype spec for powershell help output
        invoke-expression $("get-help -full {0} > ~/temp/cached_ps_help/{0}_help.txt" -f $topic)
      }

      function hghp([string]$topic)
      {
        # TODO: Find a Vim filetype spec for Mercurial help output
        invoke-expression $("hg -v help {0} | v -R -" -f $topic)
      }


      function battery
      {
        if ( $on_laptop )
        {
          write-output "Estimated Battery Remaining: $((get-WmiObject win32_battery).EstimatedChargeRemaining)%"
        }
        elseif ( $on_desktop )
        {
          write-output "You're on the desktop, you silly!"
        }
        else
        {
          write-output "lolwut?"
        }
      }

      #function lsx([string]$other_params)
      #{
      #  # TODO: This won't actually properly work yet.
      #  invoke-expression $("Get-ChildItem -Exclude .* {0}" -f $other_params)
      #  Get-ChildItem -Exclude .*
      #}

#│-v-1 │ Prompt Line
#└─────┴─────────────
function prompt
{
  # Default contents:
  #"PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "
  ## .Link
  ## http://go.microsoft.com/fwlink/?LinkID=225750
  ## .ExternalHelp System.Management.Automation.dll-help.xml

  # Refer to these sites for info:
  # http://technet.microsoft.com/en-us/library/hh847739.aspx

  #$saved_last_exit_code = $LastExitCode
  $the_history = $(get-history)
  $command_number = 1
  if ( $the_history.Length -ne 0 )
  {
    $command_number = $(get-history)[-1].id + 1
    Write-Host "`n" -NoNewLine
    #if ( $saved_last_exit_code -eq $null -or $saved_last_exit_code -eq 0 )
    #{
      #Write-Host "OK`n" -ForegroundColor "Green"
    #}
    #else
    #{
      #Write-Host "X $($saved_last_exit_code)`n" -ForegroundColor "Red"
    #}
  }

  # Abbreviate the home directory
  $prompt_path = $($executionContext.SessionState.Path.CurrentLocation)
  $prompt_path = $prompt_path -replace $($home -replace "\\", "\\"), "~"
  $prompt_path += "\"

  Write-Host $($prompt_path) -NoNewLine -ForegroundColor "Blue"

  # repo branch and status by color
  #-v-
  #-^-

  Write-Host "`n[" -ForegroundColor "darkgreen" -NoNewLine

  Write-Host "r $($command_number)" -ForegroundColor "blue" -NoNewLine
  Write-Host "] $('>' * ($nestedPromptLevel + 1))" -ForegroundColor "darkgreen" -NoNewLine

# Must return an object
  " "
}
