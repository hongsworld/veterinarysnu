require 'rubygems'
require 'docx'
class PaperController < ApplicationController
  def neodin
      @in_date = flash[:in_date]
      @out_date = flash[:out_date]
  end




  def snu_urine
  end

	def snu_cytology
	end


  def snu_cytology_process
    n = SnuCytology.new
    n.date = Time.now.strftime("%g%m%d").to_s
    n.patient_name = params[:patient_name]
    n.patient_id = params[:patient_id]
    n.species = params[:species]
    n.breeds = params[:breeds]
    n.sex = params[:sex]
    n.age = params[:age]
    n.lesion = params[:lesion]
		n.dx = params[:dx]
    n.save
    date = Time.now.strftime("%g%m%d").to_s
    hospital = params[:hospital]
    patient_name = params[:patient_name]
    patient_id = params[:patient_id]
    species = params[:species]
    breeds = params[:breeds]
    sex = params[:sex]
    age = params[:age]
    lesion = params[:lesion]
    dx = params[:dx]

    `mkdir -p  '/home/hongs/Dropbox/임상병리 현미경 사진/SAMC/#{Time.now.strftime("%Y")}/#{date[2..3]}월/세포학/(#{date})#{patient_id}_#{patient_name}_#{lesion}'`
    sleep(0.5)

	doc = Docx::Document.open('/home/hongs/SNUVMTH_CP/cytology_standard.docx')
	doc.bookmarks['patient_id'].insert_text_after(patient_id)
	doc.bookmarks['date'].insert_text_after(date)
	doc.bookmarks['species'].insert_text_after(species)
	doc.bookmarks['breeds'].insert_text_after(breeds)
	doc.bookmarks['patient_name'].insert_text_after(patient_name)
	doc.bookmarks['sex'].insert_text_after(sex)
	doc.bookmarks['age'].insert_text_after(age)
	doc.bookmarks['lesion'].insert_text_after(lesion)
	doc.bookmarks['dx'].insert_text_after(dx)

        `mkdir -p '/home/hongs/Dropbox/SNUVMTH/#{Time.now.strftime("%Y")}/#{date[2..3]}월/세포학'`
        sleep(0.5)

        doc.save("/home/hongs/Dropbox/SNUVMTH/#{Time.now.strftime("%Y")}/#{date[2..3]}월/세포학/(#{date})#{patient_id}_#{patient_name}_#{lesion}_#{dx}.docx")



    redirect_to :controller => "paper", :action => "snu_cytology"

  end




  def snu_urine_process
    n = SnuUrine.new
    n.date = Time.now.strftime("%g%m%d").to_s
    n.patient_name = params[:patient_name]
    n.patient_id = params[:patient_id]
    n.species = params[:species]
    n.breeds = params[:breeds]
    n.sex = params[:sex]
    n.age = params[:age]
    n.color = params[:color]
    n.turbidity = params[:turbidity]
    n.dx_type = params[:dx_type]
    n.save
    date = Time.now.strftime("%g%m%d").to_s
    hospital = params[:hospital]
    patient_name = params[:patient_name]
    patient_id = params[:patient_id]
    species = params[:species]
    breeds = params[:breeds]
    sex = params[:sex]
    age = params[:age]
    color = params[:color]
    turbidity = params[:turbidity]
    dx_type = params[:dx_type]
    type_arr = ["nrf", "화생", "증생", "결정", "화생 증생", "방광염", "세균성 방광염", "혈뇨"]
     

    `mkdir -p  '/home/hongs/Dropbox/임상병리 현미경 사진/SAMC/#{Time.now.strftime("%Y")}/#{date[2..3]}월/요침사/(#{date})#{patient_id}_#{patient_name}_요침사'`
    sleep(0.5)

	doc = Docx::Document.open('/home/hongs/SNUVMTH_CP/urine_standard.docx')
	doc.bookmarks['id'].insert_text_after(patient_id)
	doc.bookmarks['date'].insert_text_after(date)
	doc.bookmarks['species'].insert_text_after(species)
	doc.bookmarks['breeds'].insert_text_after(breeds)
	doc.bookmarks['patient_name'].insert_text_after(patient_name)
	doc.bookmarks['sex'].insert_text_after(sex)
	doc.bookmarks['year'].insert_text_after(age)
	doc.bookmarks['color'].insert_text_after(color)
	doc.bookmarks['turbidity'].insert_text_after(turbidity)

        if dx_type == "0" #nrf
		doc.bookmarks['microscopic_finding'].insert_text_after("무핵 각화 편평 상피세포들이 소수 관찰되었습니다. 배경에 무정형의 과립이 소수 관찰되며 과립원주가 소수 관찰되었습니다. 적혈구가 소수 관찰되었으며 기타 염증 및 감염체의 증거는 관찰되지 않았습니다.")
		doc.bookmarks['morphologic_diagnosis'].insert_text_after("Within normal limits")
		doc.bookmarks['comments'].insert_text_after("침사물의 세포학적 검사 결과, 임상적 의의를 가질만한 세포학적 증거는 관찰되지 않았습니다.")
	elsif dx_type == "1" #화생
		doc.bookmarks['microscopic_finding'].insert_text_after("세포충실도는 ~~였습니다. 개별적으로 탈락한 유핵 및 무핵 각화상피세포가 ~~ 관찰되었습니다. 무정형의 과립이 ~~수 관찰되며 과립원주가 ~~ 관찰되었습니다 기타 염증 세포 및 감염체는 확인되지 않았습니다.")
		doc.bookmarks['morphologic_diagnosis'].insert_text_after("Suspected to squamous metaplasia of urinary bladder epithelium ")
		doc.bookmarks['comments'].insert_text_after("침사물의 세포학적 검사 결과, 방광상피세포의 각화편평상피세포로의 화생이 의심됩니다. 화생은 결석, 염증, 종양 등에 의한 방광벽의 만성적인 자극에 의해서 발생할 수 있습니다. 환자의 임상증상, 혈액혈청화학검사 및 영상검사를 종합적으로 판단하시길 추천드립니다.")
		
    	elsif dx_type == "2" #증생
		doc.bookmarks['microscopic_finding'].insert_text_after("군집 또는 개별 탈락한 방광이행상피세포가 ~~ 관찰되었습니다.  배경에는 무정형의 과립이 ~~ 관찰되었으며 과립원주는 ~~ 관찰되었습니다. 기타 감염체는 확인되지 않았습니다.")
		doc.bookmarks['morphologic_diagnosis'].insert_text_after("Suspected to hyperplasia of urinary bladder epithelium")
		doc.bookmarks['comments'].insert_text_after("침사물의 세포학적 검사 결과, 방광이핵상피세포의 탈락이 증가되어 관찰되는 증생 소견이 확인되었습니다. 증생은 결석, 염증, 종양 등에 의한 방광벽의 만성적인 자극에 의해서 발생할 수 있습니다. 환자의 임상증상, 혈액혈청화학검사 및 영상검사를 종합적으로 판단하시길 추천드립니다.")
	elsif dx_type == "3" #결정
		doc.bookmarks['microscopic_finding'].insert_text_after("개별적으로 탈락한 방광이행상피세포가 ~~ 관찰되었습니다. 배경에 ~~~~~ 결정이 ~~ 관찰되었습니다. 또한 무정형의 과립물질이 ~~ 관찰되었습니다. 적혈구 개재는 ~~ 으로 관찰되었습니다. 기타 감염체 및 염증의 증거는 관찰되지 않았습니다.")
		doc.bookmarks['morphologic_diagnosis'].insert_text_after("Crystalluria")
		doc.bookmarks['comments'].insert_text_after("침사물의 세포학적 검사 결과, ~~~결정 증가가 확인되는 결정뇨 소견입니다. 영상학적 접근을 통하여 신장, 신우, 방광 내의 결석 유무를 확인하시길 추천드립니다. 다만 요 침사물에 관찰되는 결정과 결석의 성분이 항상 일치하는 것은 아니므로, 정확한 성분 평가를 위해서는 결석에 대한 성분 검사가 필요합니다. 결석과 관련하여 지속적인 모니터링이 추천되며, 환자의 상태를 종합하여 평가하시길 바랍니다. ")
	elsif dx_type == "4" #화생 증생
		doc.bookmarks['microscopic_finding'].insert_text_after("개별적으로 탈락한 무핵 및 유핵 각화편평상피세포가 ~~ 관찰되었으며, 군집 또는 개별적으로 탈락한 방광이행상피세포도 ~~ 관찰되었습니다. 무정형의 과립이 ~~ 관찰되었습니다. 기타  감염체는 확인되지 않았습니다.")
		doc.bookmarks['morphologic_diagnosis'].insert_text_after("Suspected to hyperplasia and squamous metaplasia of urinary bladder epithelium" )
		doc.bookmarks['comments'].insert_text_after("침사물의 세포학적 검사 결과, 방광이행상피세포의 유핵각화편평상피세포로의 화생이 소견과 함께, 방광이핵상피세포의 탈락이 증가되어 관찰되는 증생 소견이 확인되었습니다. 증생 및 화생은 결석, 염증, 종양 등에 의한 방광벽의 만성적인 자극에 의해서 발생할 수 있습니다. 환자의 임상증상, 혈액혈청화학검사 및 영상검사를 종합적으로 판단하시길 추천드립니다.")
	elsif dx_type == "5" # 방광염
		doc.bookmarks['microscopic_finding'].insert_text_after("호중구가 ~~ 관찰되었습니다. 호중구의 핵은 ~~ 관찰되었습니다. 배경에는 무정형의 과립이 ~~ 관찰되며 과립원주는 ~~ 관찰되었습니다. 적혈구의 개재는 ~~ 관찰되었습니다. ")
		doc.bookmarks['morphologic_diagnosis'].insert_text_after("Suspected to neutrophilic cystitis")
		doc.bookmarks['comments'].insert_text_after("침사물의 세포학적 검사 결과, 호중구가 주종으로 관찰되는 바, 호중구성 방광염의 가능성이 고려됩니다. 본 증례의 세포학적 검사상 감염체는 확인되지 않았으나, 호중구성 방광염이 고려되는 바, 세균감염의 배제를 위해 배양검사를 추천드리며 필요시 항생제 감수성 검사를 진행하시길 바랍니다.  임상적 의의를 가질만한 세포학적 증거는 관찰되지 않았습니다.")
	elsif dx_type == "6" # 세균성 방광염
		doc.bookmarks['microscopic_finding'].insert_text_after("호중구가 ~~ 관찰되며 배경 및 호중구 내에 ~~균이 ~~ 관찰되었습니다. 호중구의 핵은 ~~ 관찰되었습니다. 배경에는 무정형의 과립이 ~~ 관찰되며 과립원주는 ~~ 관찰되었습니다. 적혈구의 개재는 ~~ 관찰되었습니다.")
		doc.bookmarks['morphologic_diagnosis'].insert_text_after("Bacterial cystitis")
		doc.bookmarks['comments'].insert_text_after("호중구가 ~~ 관찰되며 배경 및 호중구 내에 탐식된 ~~ 균이 ~~| 관찰되는 세균성 방광염 소견입니다. 세균 동정을 위한 배양검사를 추천드리며 필요시 항생제 감수성 검사를 진행하시길 추천드립니다. 감염 및 염증에 대한 적절한 내과적 처치를 진행하시길 바랍니다.")
	elsif dx_type == "7" # 혈뇨
		doc.bookmarks['microscopic_finding'].insert_text_after("개별탈락된 방광이행상피세포가 ~~ 관찰되었습니다. 방광이행상피세포의 세포대소부동은 ~~, 핵 대소부동은 ~~ ㄱ로 관찰되었습니다. 배경에는 무정형의 과립이 ~~, 과립원주는 ~~ 관찰되며, 적혈구는 고배율상 ~~~개 정도로 관찰되었습니다.")
		doc.bookmarks['morphologic_diagnosis'].insert_text_after("Hematuria")
		doc.bookmarks['comments'].insert_text_after("~~~의 적혈구 개재가 관찰되는 혈뇨 소견입니다. 혈뇨의 경우 만성적인 방광벽에 대한 자극의 경롸로 나타날 수 있습니다. 추가적으로, 물리적인 외상 및 응고계 부전으로 인해서 발생할수 있으므로, 환자의 임상정황 및 병력을 종합적으로 접근하시길 추천드립니다. ")
	else 
	end

        `mkdir -p '/home/hongs/Dropbox/SNUVMTH/#{Time.now.strftime("%Y")}/#{date[2..3]}월/요침사'`
        sleep(0.5)

        doc.save("/home/hongs/Dropbox/SNUVMTH/#{Time.now.strftime("%Y")}/#{date[2..3]}월/요침사/(#{date})#{patient_id}_#{patient_name}_요침사_#{type_arr[dx_type.to_i]}.docx")



    redirect_to :controller => "paper", :action => "snu_urine"

  end



  def neodin_list
    @neodin = Neodin.all.reverse
  end

  def neodin_detail
    @neodin = Neodin.find(params[:id])
  end

  def neodin_process
    n = Neodin.new
    n.in_date = params[:in_date]
    n.out_date = params[:out_date]
    n.hospital = params[:hospital]
    n.patient_name = params[:patient_name]
    n.species = params[:species]
    n.breeds = params[:breeds]
    n.sex = params[:sex]
    n.age = params[:age]
    n.site = params[:site]
    n.macro = params[:macro]
    n.save
    indate = params[:in_date]
    outdate = params[:out_date]
    hospital = params[:hospital]
    patient_name = params[:patient_name]
    species = params[:species]
    breeds = params[:breeds]
    sex = params[:sex]
    age = params[:age]
    site = params[:site]
    macro = params[:macro]


    `mkdir -p '/home/hongs/Dropbox/Neodin/Microscopic_picture/#{indate[0..3]}년/#{indate[4..5]}월/#{indate[6..7]}일/#{indate}_#{hospital}_#{patient_name}_#{species}_#{breeds}_#{sex}_#{age}_#{site}'`
    sleep(0.5)

	doc = Docx::Document.open('/home/hongs/SNUVMTH_CP/standard.docx')
	doc.bookmarks['date1'].insert_text_after("#{indate[2..3]}/#{indate[4..5]}/#{indate[6..7]}")
	doc.bookmarks['date2'].insert_text_after("#{outdate[2..3]}/#{outdate[4..5]}/#{outdate[6..7]}")
	doc.bookmarks['hospital'].insert_text_after(hospital)
	doc.bookmarks['species'].insert_text_after(species)
	doc.bookmarks['breeds'].insert_text_after(breeds)
	doc.bookmarks['name'].insert_text_after(patient_name)
	doc.bookmarks['sex'].insert_text_after(sex)
	doc.bookmarks['age'].insert_text_after(age)
	doc.bookmarks['gross_findings1'].insert_text_after(site)
	doc.bookmarks['gross_findings2'].insert_text_after(macro)
	doc.bookmarks['morphologic_diagnosis'].insert_text_after("")
	doc.bookmarks['comments'].insert_text_after("")
        `mkdir -p '/home/hongs/Dropbox/Neodin/Opinion_paper/#{indate[0..3]}년/#{indate[4..5]}월/#{indate[6..7]}일'`
        sleep(0.5)

	doc.save("/home/hongs/Dropbox/Neodin/Opinion_paper/#{indate[0..3]}년/#{indate[4..5]}월/#{indate[6..7]}일/#{indate[0..7]}_#{hospital}_#{patient_name}(#{species})_#{site}.docx")



    flash[:in_date] = params[:in_date]
    flash[:out_date] = params[:out_date]   
    redirect_to :controller => "paper", :action => "neodin"

  end

  def snu
  end
end
