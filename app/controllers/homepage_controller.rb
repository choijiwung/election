class HomepageController < ApplicationController
    
  def index
    require "json"
    require "nokogiri"
    # require 'httparty'
    require 'rest-client'
    


    url = "http://info.nec.go.kr/main/main_election_precandidate.json?electionId=0020180613&sgTypeCode=3&sggCode=3110000&emdCode=112111&startIndex=0&endIndex=9" 
    response = RestClient.get(url)
    @parsed = JSON.parse(response)
    @code = @parsed["hbjMap"][0]["SG_TYPECODE"]
    @name = @parsed["hbjMap"][0]["HBJNAME"]
    @photo = "http://info.nec.go.kr/photo_20180613" + @parsed["hbjMap"][0]["IMAGE_FILE"]     
    @party = @parsed["hbjMap"][0]["JDNAME"]     
    @huboId = @parsed["hbjMap"][0]["HUBOID"]
    @link = "http://info.nec.go.kr/electioninfo/precandidate_detail_info.xhtml?electionId=0020180613&huboId=" + @huboId.to_s
    
    # {"HBJNAME"=>"김문수(金文洙)", "EMDNAME"=>"신림동", "HBJGIHO"=>nil, "EMDID"=>112111, "SUB_SG_ID"=>320180613, "SG_ID"=>20180613, "IMAGE_FILE"=>"/Sd1100/Sgg3110000/Hb100129583/gicho/100129583.JPG", "WIWNAME2"=>"종로구", "HUBOID"=>100129583, "RN"=>1, "CNT"=>8, "JDNAME"=>"자유한국당", "SG_TYPECODE"=>3,

  end

end
