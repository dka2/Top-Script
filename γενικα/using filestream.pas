procedure textXML;
var
  fs: tfilestream;
  s: string;
  r: variant;
begin
  //TEST table is "create table _testXML(id int identity not null primary key, data varchar(max), datXML XML)"
  //
  //upload xml file to server
  fs:= tfilestream.create('D:\demo\delphi\Synapse https\test1\sendInvoice.xml',fmOpenRead);
  try
    fs.read(s, fs.size);
    r:= prg.QueryValues('INSERT INTO _testXML(data,datXml) OUTPUT Inserted.ID VALUES(:1,:2)', [s,s]);
    //showmessage(r);
  finally
    fs.free;
  end;
  
  //Get an XML from server and save to file
  fs:= tfilestream.create('D:\demo\delphi\xxx.xml',fmCreate);
  try
    r:= prg.QueryValues('select datXML from _testXML where id=:1', r);
    fs.write(r, length(r));
  finally
    fs.free;
  end;  
end;
