unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, ComObj;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    LaN1: TLabeledEdit;
    LaN2: TLabeledEdit;
    Sg1: TStringGrid;
    Sg2: TStringGrid;
    Button1: TButton;
    LaShag: TLabeledEdit;
    Button2: TButton;
    LaShN: TLabeledEdit;
    LaShDelt: TLabeledEdit;
    LaShK: TLabeledEdit;
    BtLoad: TButton;
    procedure BtLoadClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LaN2Change(Sender: TObject);
    procedure LaN1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
 TZn = record
   Xob,Date,X1,X2,Y1,Y2:Double;
 end;
 TArZn = array of TZn;

var
  Form1: TForm1;
  Excel: Variant;
  Znat:TArZn;

implementation

{$R *.dfm}

procedure GoShag(VivodExcel:boolean; var Znat:TArZn);
var
min,max,shag,x1,x2,y1,y2,ymin:Double;
max1,max2:Double;
z11,z12,a11,a12:Double;
z21,z22,a21,a22:Double;
k1,k2,b1,b2:Double;
Row1,Row2:Longword;

i:longword;
begin
With Form1 do
begin
if VivodExcel then
  begin
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.Add;
  end;
Max:=StrToFloat(Sg1.Cells[0,1])+StrToFloat(Sg2.Cells[0,1]);
Min:=StrToFloat(Sg1.Cells[0,Sg1.RowCount-1])+StrToFloat(Sg2.Cells[0,Sg2.RowCount-1]);
shag:=StrToFloat(LaShag.Text);
SetLength(Znat,Trunc((Max-Min)/Shag)+10);
for i := 0 to Length(Znat) - 1 do
  Znat[i].Date:=0;
x1:=StrToFloat(Sg1.Cells[0,1]);
max1:=StrToFloat(Sg1.Cells[0,Sg1.RowCount-1]);
Row1:=2;
while x1>max1 do
  begin
  if x1<StrToFloat(Sg1.Cells[0,Row1]) then
    Inc(Row1);
  a11:=StrToFloat(Sg1.Cells[0,Row1-1]);
  a12:=StrToFloat(Sg1.Cells[0,Row1]);
  z11:=StrToFloat(Sg1.Cells[1,Row1-1]);
  z12:=StrToFloat(Sg1.Cells[1,Row1]);

  k1:=(z12-z11)/(a12-a11);
  b1:=z12-k1*a12;
  y1:=k1*x1+b1;


  x2:=StrToFloat(Sg2.Cells[0,1]);
  max2:=StrToFloat(Sg2.Cells[0,Sg2.RowCount-1]);
  Row2:=2;
  while x2>max2 do
    begin
    if x2<StrToFloat(Sg2.Cells[0,Row2]) then
      Inc(Row2);
    a21:=StrToFloat(Sg2.Cells[0,Row2-1]);
    a22:=StrToFloat(Sg2.Cells[0,Row2]);
    z21:=StrToFloat(Sg2.Cells[1,Row2-1]);
    z22:=StrToFloat(Sg2.Cells[1,Row2]);

    k2:=(z22-z21)/(a22-a21);
    b2:=z22-k2*a22;
    y2:=k2*x2+b2;

    if y2>y1 then
      ymin:=y1
    else
      ymin:=y2;

    If Znat[Trunc(((x1+x2)-Min)/Shag)].Date<ymin then
      begin
      Znat[Trunc(((x1+x2)-Min)/Shag)].Xob:=(x1+x2);
      Znat[Trunc(((x1+x2)-Min)/Shag)].X1:=x1;
      Znat[Trunc(((x1+x2)-Min)/Shag)].X2:=x2;
      Znat[Trunc(((x1+x2)-Min)/Shag)].Y1:=y1;
      Znat[Trunc(((x1+x2)-Min)/Shag)].Y2:=y2;
      Znat[Trunc(((x1+x2)-Min)/Shag)].Date:=ymin;
      end;

    x2:=x2-shag/100;
    end;
  x1:=x1-shag/100;
  end;
if VivodExcel then
begin
for i := 0 to Length(Znat) - 1 do
  begin
  Excel.Cells[i+1,1]:=i*shag+min;
  Excel.Cells[i+1,2]:=Znat[i].Date;
  Excel.Cells[i+1,3]:=Znat[i].X1;
  Excel.Cells[i+1,4]:=Znat[i].X2;
  Excel.Cells[i+1,5]:=Znat[i].Y1;
  Excel.Cells[i+1,6]:=Znat[i].Y2;
  end;
Excel.Workbooks[1].saveas('Нечеткое множество.xlsx');
Excel.Workbooks.Close;
Excel.Application.Quit;
end;
end;
end;

procedure TForm1.BtLoadClick(Sender: TObject);
var
i:byte;
begin
Excel := CreateOleObject('Excel.Application');
Excel.Workbooks.open('Формализация для статей2.xlsx');
For i:=0 to 3 do
  begin
  Sg1.Cells[0,i+1]:=Excel.Cells[25,2+i];
  Sg1.Cells[1,i+1]:=Excel.Cells[26,2+i];
  Sg2.Cells[0,i+1]:=Excel.Cells[25,8+i];
  Sg2.Cells[1,i+1]:=Excel.Cells[26,8+i];
  end;
Excel.Workbooks.Close;
Excel.Application.Quit;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  GoShag(True,Znat);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
Sh,DSh,NSh,sDelt:double;
ZnatPred:TArZn;
i,j,n,Row:Longword;
begin
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.Add;
NSh:=StrToFloat(LaShN.Text);
DSh:=StrToFloat(LaShDelt.Text);
Sh:=StrToFloat(LaShK.Text);
SetLength(ZnatPred,0);
Row:=2;
while Sh>NSh do
  begin
  LaShag.Text:=FloatTostr(Sh);
  GoShag(False,Znat);
  sDelt:=0;
  n:=Length(Znat);
    Excel.Cells[Row,1]:=Sh;
    Excel.Cells[Row,2]:=n;
  i:=0;
  if (Length(ZnatPred)<>0) and (n<>0) then
  for j := 0 to Length(ZnatPred) - 1 do
    begin
    while (i<n) and (Znat[i].Xob<ZnatPred[j].Xob) do
      inc(i);
    if i<n then    
      sDelt:=sDelt+sqr(Znat[i].Date-ZnatPred[j].Date);
    end;
    Excel.Cells[Row,3]:=sDelt;

  SetLength(ZnatPred,n);
  for i := 0 to n - 1 do
    ZnatPred[i]:=Znat[i];

  inc(Row);
  Sh:=Sh-DSh;
  end;
  Excel.Workbooks[1].saveas('Нечеткое множество Точность.xlsx');
  Excel.Workbooks.Close;
  Excel.Application.Quit;
end;

procedure TForm1.LaN1Change(Sender: TObject);
begin
Sg1.RowCount:=StrToInt(self.LaN1.Text)+1;
end;

procedure TForm1.LaN2Change(Sender: TObject);
begin
Sg2.RowCount:=StrToInt(self.LaN2.Text)+1;
end;

end.
