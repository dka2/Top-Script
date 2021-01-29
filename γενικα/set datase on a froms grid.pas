var 
  c: TWinControl;
  ds :TDataSet
begin
  c:= frm.GetControlFromLi('xxx');
  ds:= prg.QueryDataSet(frm; 'select ***', Params); 
  c.SetDS(ds)
end;
