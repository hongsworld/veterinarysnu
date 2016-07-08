require 'docx'
require 'date'

doc = Docx::Document.open('standard.docx')
today = Date.today
tomorrow = today + 1
  doc.bookmarks['date1'].insert_text_after("#{today.strftime("%y")}/#{today.strftime("%m")}/#{today.strftime("%d")}")
  doc.bookmarks['date2'].insert_text_after("#{tomorrow.strftime("%y")}/#{tomorrow.strftime("%m")}/#{tomorrow.strftime("%d")}")
  doc.bookmarks['hospital'].insert_text_after("이홍석동물병원")
  doc.bookmarks['species'].insert_text_after("사람")
  doc.bookmarks['breeds'].insert_text_after("황인종")
  doc.bookmarks['name'].insert_text_after("이홍석")
  doc.bookmarks['sex'].insert_text_after("남2")
  doc.bookmarks['age'].insert_text_after("27 년령")
  doc.bookmarks['gross_findings'].insert_text_after("")
  doc.bookmarks['morphologic_diagnosis'].insert_text_after("")
  doc.bookmarks['comments'].insert_text_after("")

doc.save('test2.docx')

