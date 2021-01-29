procedure msXMLTest;
var
  root,
  r: variant;
  xDoc: variant;
begin
  xDoc:= CreateOleObject('MSXML2.DOMDocument');  //microsoft xml
  xDoc.async:= false;
  xDoc.load('D:\demo\delphi\x8.xml'); //load from file 
  //xDoc.load('https://software-solutions-online.com/feed/');  //load from http
  
  //upload to sql server
  r:= prg.QueryValues('INSERT INTO _testXML(data,datXml) OUTPUT Inserted.ID VALUES(:1,:2)', [xDoc.Xml,xDoc.Xml]);
  //showmessage(r); //retrun ID
  
  //get from sql server
  r:= prg.QueryValues('select datXML from _testXML where id=:1', r);  
  xDoc.LoadXml(r);
  root:= xDoc.documentElement; // is root node
  root.insertBefore(xDoc.CreateNode(1,'test1',''), root.childNodes.item(0));  //insert element at position root.item(0) 
  root.appendChild(xDoc.createComment('Hello World!'));
  xDoc.Save('D:\demo\delphi\x8_save.xml');  //save to file, or can save to http!! 
end;
