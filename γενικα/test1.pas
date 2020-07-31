var            
  f: Tform;
  cImage: TImage;                              
  
procedure DoClick2;
begin                         
  f.visible:= true;
end;

procedure cImage_OnClick;
var 
  ds: TclientDataSet;
begin
  if itemtrnds['iteDescr'].isnull then
    exit;    
  ds:= prg.QueryDataSet(nil, 'exec usp_SelectImage :1', itemtrnds['itemID'].value);
  try
    TBlobField(ds.fields[1]).SaveToFile('d:\test1.png');
    cImage.Picture.loadfromfile('d:\test1.png');    
  finally
    ds.free;
  end;
  //cImage.Picture.loadfromfile('D:\dka''s Documents\Axialis Librarian\Objects\Pack 9 - iPhone Tab Bar Icons\_HID_icon_sample9a.jpg');  
  f.caption:= itemtrnds['iteDescr'].asstring;
end;

procedure BeforeLoad;
begin
  showmessage('Hi');
end;

procedure init;
begin
  frm.addinditask('show φορμα', @DoClick2, nil, true);  
end;

Begin
  bol.oninitialize:= @init;
  f:= Tform.create(frm);
  f.FormStyle:= fsStayOnTop;
  f.SetBounds(800,200,200,200);  
  f.borderStyle:= bsSizeToolWin;
  f.caption:= 'photo';
  cImage:= TImage.create(f);
  cImage.align:= alclient;
  cImage.parent:= f;  
  cImage.OnClick:= @cImage_OnClick;   
End.
