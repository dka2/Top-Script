procedure SendEmail;
var 
  fs: tfileStream;
  s: string;
begin                                    
  if not IsNull(newvalue) then begin
    fs:= tfilestream.create('c:\htmlEmail.html', fmOpenRead);
    fs.read(s, fs.size);
    fs.free;
    prg.SendEmail('xxx@gmail.com', '', '', 'subject', s, '', true, true);
  end;  
end;
