Pod::Spec.new do |s|
  s.name             = 'APIVerveCompanyLookup'
  s.version          = '1.2.3'
  s.summary          = 'Company Lookup matches stock tickers, CIK numbers, company names, or SIC codes with official SEC registration records.'
  s.description      = <<-'DESC'
Company Lookup matches stock tickers, CIK numbers, company names, or SIC codes with official SEC registration records. It returns legal entity names, trading exchanges, tax EINs, Standard Industrial Classification codes, and registered business addresses.

This iOS/macOS SDK provides a convenient way to access the Company Lookup from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/companylookup?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/companylookup-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveCompanyLookup/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
