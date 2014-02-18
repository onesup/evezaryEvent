require 'spec_helper'

describe Message do
  it "지정된 시간 이내에만 실행" do
    message = Message.new
    result = message.waiting_for_result(1.seconds, 3.seconds)
    expect(result).to eql(true)
  end
  
  it "실행 중간에 call_status가 변경되면?" do
    message = Message.new
    message.result = "--"
    message.save
    result = ReportJob.perform(1.seconds, 3.seconds)
    expect(result).to eql(true)
  end
  
end
