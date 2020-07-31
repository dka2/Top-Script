var            
  MaintFldItemTrnDS: TaClientdataSet;
  f: Tform;
  cImage: TImage;                              
procedure DoClick;
var fmaint         : TMFormLink;                  
begin                         
  showmessage('a !!!');
  fmaint:= TMFormLink(PRG.CreateForm('TFMAINTFLD', 5, null));  
  SHOWMESSAGE('INIT...FMAINT');  
  fmaint.BrowserDef.ExtraWhere:= '1 > 0'; //just test     
  Taction(fmaint.findcomponent('acInsert')).Execute;  
end;

procedure BeforeAddMaintFldItem(folder, SprSrvID: integer);
begin
  //showmessage(format('before a:%d - b:%d',[folder, SprSrvID]));
  itemtrnDS.edit;
  itemtrnDS.fieldbyname('Justification').value:= SprSrvID;
end;

procedure AfterAddMaintFldItem(folder, SprSrvID: integer);
begin
  showmessage(format('After a:%d - b:%d',[folder, SprSrvID]));
end;

procedure Pay;
var //i: TADC_IndirectlyTask;
  f: tform;
begin
  //c:= frm.GetControlFromLi('itmcmdExtraCharges');
  //c.onclick[pxoCOnly]:= @DoClick
  //i:= frm.getinditask('acFastEntry');
  //i.execute;
  f:= CreateFastEntryForm(nil, 'mbrItembarCode', TAdcDBGrid( frm.findcontrol('GrdItems')));
  f.showmodal;
  f.free;
  
end;
procedure FastEntryGetSubCategoriesSQL(POSCategory, aLevel: integer; aCode: array[1..7] of string;var sqlSelect, sqlOrder: string);
var s: string;
begin
  s:= 'SubCategories'+ #13#10'cat:' + Inttostr(POSCategory) +' level:'+ Inttostr(aLevel) + ' code:'+aCode[1];
  //showmessage(s+#13#10+sqlSelect);
  s:= IntToStr(aLevel+1);   
  sqlSelect:= sqlSelect + 
              'union all '
             +'Select '+s+', ''x1'', ''x1 descr' + s + ' '' ';
end;


procedure mini(rinfo: TMiniBrowserRequestInfo);
begin
  if (rinfo.EventType = mbrZoom) and sametext(rinfo.Control.PropByName['DataField'], 'ship_amid') then begin
    rinfo.Control.ExtraSQLWhere:= '1=1';
    showmessage(rinfo.Control.MiniBrowserDefs +'/'+ rinfo.Control.PropByName['DataField'] + '/' + rinfo.MbrKind);
    //if rinfo.Control.MiniBrowserDefs = 'mbrAllMasterBranch' then
      rinfo.Control.ExtraSQLWhere:= 'BillToAmId = ' + AMTRN_S1DS.fieldbyname('amid').asstring;    
  end;
end;

procedure FastEntryGetItemsSQL(POSCategory, aLevel: integer; LevelCodes: array[1..2] of string ;var sqlWhere, sqlOrder: string);
var i: integer;
    s: string;
begin
  s:='ItemsSQL'+#13#10;
  for i:=1 to Length(LevelCodes) do
    s:= s+LevelCodes[i] + '/';
  s:= s +#13#10 + sqlWhere;
  SqlWhere := 'select top '+Inttostr(aLevel)+' ID from item where :x is not null';
  //showmessage(s);
end;

procedure ItemTrnDS_OnCheckReadOnly;
begin

end;

procedure DoClick2;
begin                         
  f.visible:= true;
end;

procedure cImage_OnClick;
begin
  if itemtrnds['iteDescr'].isnull then
    exit;
  cImage.Picture.loadfromfile('D:\dka''s Documents\Axialis Librarian\Objects\Pack 9 - iPhone Tab Bar Icons\_HID_icon_sample9a.jpg');
  f.caption:= itemtrnds['iteDescr'].asstring;
end;

procedure volume;
//var divi: double;
begin
  if itemtrnDS.FieldByName('VCatCodeID').AsInteger = 0 then
    itemtrnDS.FieldByName('Price').AsFloat:= itemtrnDS.FieldByName('Volume').AsFloat  
  else 
    //divi:= 
    itemtrnDS.FieldByName('Price').AsFloat:=  itemtrnDS.FieldByName('Volume').AsFloat / (1 + itemtrnDS.FieldByName('VCatCodeID').AsInteger/100);
end;

procedure vat;
begin
  if itemtrnDS.FieldByName('VCatCodeID').AsInteger = 0 then
    itemtrnDS.FieldByName('Price').AsFloat:= itemtrnDS.FieldByName('Volume').AsFloat  
  else
    itemtrnDS.FieldByName('Price').AsFloat:=  itemtrnDS.FieldByName('Volume').AsFloat / (1 + itemtrnDS.FieldByName('VCatCodeID').AsInteger/100);
end;

procedure BeforeLoad;
begin
  showmessage('Hi');
{  DocExtraChargesDS.append;
  DocExtraChargesDS.fieldbyname('ExChargeCodeID').value:=2;
  DocExtraChargesDS.fieldbyname('Net_Val').value:=100;
  DocExtraChargesDS.post;}   
end;


procedure priceChange;
begin
  showmessage('1'); 
    //itemtrnDS.FieldByName('Price').AsFloat:= itemtrnDS.FieldByName('Volume').AsFloat  
end;  

procedure init;
begin
(*  //showmessage('init');
  TDocTrnBO(bol.bo).OnBeforeAddMaintFldItem:= @BeforeAddMaintFldItem;
  TDocTrnBO(bol.bo).OnAfterAddMaintFldItem:= @AfterAddMaintFldItem;    
  bol.GetDataSet('MaintFldItemTrnDS',MaintFldItemTrnDS);
  frm.addinditask('aaa', @DoClick, nil, true);
  //frm.DETAILPAGECONTROL;
  TFrmDocTrn(frm.FormInstance).OnFastEntryGetSubCategoriesSQL:= @FastEntryGetSubCategoriesSQL;
  TFrmDocTrn(frm.FormInstance).OnFastEntryGetItemsSQL := @FastEntryGetItemsSQL; 
//    showmessage(MaintFldItemTrnDS.name);
//    bol.findcomponent('MaintFldItemTrnDS')
*)

 // BOL.OnFldChange[itemtrnDS.fieldByname('Volume')]:= @volume;
 //bol.OnGenericEvent_['OnBeforeLoad']:= @BeforeLoad;
   bol.OnBeforesave:= @beforeSave;  
  //BOL.OnFldChange[itemtrnDS.fieldByname('VCatCodeID')]:= @vat;
  BOL.OnFldChange[itemtrnDS.fieldByname('Price')]:= @priceChange;
  bol.OnCheckReadOnly[ItemTrnDS]:= @ItemTrnDS_OnCheckReadOnly;
  frm.addinditask('show φορμα', @DoClick2, nil, true);  
end;

Begin
  //bol.onFldChange(AMTRN_S1DS.fieldbyname('PayID')) := @pay;
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
  frm.OnMiniBrowserRequestEx[pxoCOnly]:= @mini   
End.

//Publish('CRM/NEWENTRY','ena',mqttQos0_AtMostOnce)
