Pod::Spec.new do |s|
  s.name = "OPAttributeString"
  s.version = "0.1.1"
  s.summary = "\u94FE\u5F0F\u7F16\u7A0B\u521B\u5EFA\u5C5E\u6027\u5B57\u7B26\u4E32"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"urm9ril"=>"348043793@qq.com"}
  s.homepage = "https://github.com/urm9ril/OPAttributeString"
  s.description = "TODO: Add long description of the pod here."
  s.source = { :path => '.' }

  s.ios.deployment_target    = '11.0'
  s.ios.vendored_framework   = 'ios/OPAttributeString.framework'
end
