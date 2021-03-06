Describe 'Testing against PSSA rules' {
  Context 'PSSA Standard Rules' {
		$scriptAnalyzerRules = Get-ScriptAnalyzerRule

    $analysis = Invoke-ScriptAnalyzer -Path 'puppet-agent-installer.ps1'

    forEach ($rule in $scriptAnalyzerRules) {
			It "Should pass $rule" {
			  If ($analysis.RuleName -contains $rule) {
			    $analysis | Where RuleName -EQ $rule -outvariable failures | Out-Default
			    $failures.Count | Should Be 0
			  }
			}
    }
  }

  Context 'PSSA CodeFormatting Rules' {

	 $scriptAnalyzerRules = Get-ScriptAnalyzerRule

   $analysis = Invoke-ScriptAnalyzer -Settings CodeFormatting -Path 'puppet-agent-installer.ps1'

    forEach ($rule in $scriptAnalyzerRules) {
			It "Should pass $rule" {
			  If ($analysis.RuleName -contains $rule) {
			    $analysis | Where RuleName -EQ $rule -outvariable failures | Out-Default
			    $failures.Count | Should Be 0
			  }
			}
		}
	}

}
