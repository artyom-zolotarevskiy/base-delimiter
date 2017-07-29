/////////////////////////////////////////////////////////
///Program author: Artem Zolotarevsky////////////////////
/////////////////////////////////////////////////////////
///The program was written on July 29, 2017 at 2.25 am///
/////////////////////////////////////////////////////////

unit home;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sSkinManager, Vcl.StdCtrls, sEdit,
  sButton, sLabel, Vcl.ExtCtrls, sPanel, sDialogs, sSpinEdit, shellApi, sGauge;

type
  ThomeForm = class(TForm)
    CopyrightPanel: TsPanel;
    labelLoadCount: TsLabel;
    LoadBtn: TsButton;
    sLabel2: TsLabel;
    sSkinManager1: TsSkinManager;
    Unload: TsButton;
    dlgLoad: TsOpenDialog;
    CountLinesInOneFileEdit: TsSpinEdit;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    EndCountFilesLabel: TsLabel;
    sGauge1: TsGauge;
    procedure LoadBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CountLinesInOneFileEditChange(Sender: TObject);
    procedure CopyrightPanelClick(Sender: TObject);
    procedure UnloadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  th = class(TThread)
  private
  protected
    procedure Execute; override;
  end;

var
  homeForm: ThomeForm;
  AllList: TStringList;
  countLinesInFile, countLinesInOneFile, EndCountFiles: integer;
  resultDir: string;

implementation

{$R *.dfm}

procedure ThomeForm.CopyrightPanelClick(Sender: TObject);
begin
  ShellExecute( Handle, 'open', 'www.stf.st', nil, nil, SW_NORMAL );
end;

procedure ThomeForm.CountLinesInOneFileEditChange(Sender: TObject);
var
  n: integer;
begin
  if TryStrToInt(HomeForm.CountLinesInOneFileEdit.Text, n)  then
    if n > 0 then
    begin
      countLinesInOneFile := HomeForm.CountLinesInOneFileEdit.Value;
      EndCountFiles := countLinesInFile div countLinesInOneFile;
      HomeForm.EndCountFilesLabel.Caption := IntToStr(EndCountFiles);
    end;
end;

procedure ThomeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(AllList);
end;

procedure ThomeForm.FormCreate(Sender: TObject);
begin
    AllList := TStringList.Create;
end;

procedure ThomeForm.LoadBtnClick(Sender: TObject);
var
  AccInfo: string;
begin
  dlgLoad.Title := 'Загрузка базы';
  dlgLoad.Filter := '*.txt|*.txt';
  dlgLoad.InitialDir := ExtractFilePath(Application.ExeName);
  if dlgLoad.Execute then
    begin
     if FileExists(dlgLoad.FileName) then
      begin
        AllList.Clear;
        AllList.LoadFromFile(dlgLoad.FileName);
        countLinesInFile := AllList.Count;
        labelLoadCount.Caption := IntToStr(countLinesInFile);
        AccInfo := 'Загружено строк: ' + IntToStr(countLinesInFile);

        if countLinesInFile <> 0 then
        begin
          MessageBox(Handle, PChar(AccInfo), 'Информация', MB_ICONQUESTION);
        end;
        end
      else
      begin
        AccInfo := 'Файл не найден!';
        MessageBox(Handle, PChar(AccInfo), 'Информация', MB_ICONQUESTION);
      end;
    end;
end;

procedure ThomeForm.UnloadClick(Sender: TObject);
begin
  resultDir := ExtractFilePath(application.exename) + 'Result\' + FormatDateTime('dd.mm.yyyy_hh-nn-ss', Now);
  if not DirectoryExists(resultDir) then
  ForceDirectories(resultDir);

  homeForm.sGauge1.Progress := 0;
  homeForm.sGauge1.MaxValue := EndCountFiles;
  th.Create(false);
end;

procedure th.Execute;
var
  CurrentFileId, LinesIdBigFile, LinesIdCurrentFile: integer;
  FileName, s: string;
  fs: TFileStream;
begin
try
  LinesIdBigFile := 1;
   for CurrentFileId := 1 to EndCountFiles do
   begin
    LinesIdCurrentFile := 1;
    FileName := resultdir + '\' + IntToStr(CurrentFileId) + '.txt';

    fs := TFileStream.Create(FileName, fmCreate);

    try
      while LinesIdCurrentFile <= countLinesInOneFile do
      begin
        s := AllList[LinesIdBigFile - 1] + #13#10;
        fs.WriteBuffer(s[1], Length(s) * SizeOf(s[1]));
        Inc(LinesIdCurrentFile);
        Inc(LinesIdBigFile);
      end;
    finally
      fs.Free;
    end;

    homeForm.sGauge1.Progress := homeForm.sGauge1.Progress + 1;
    homeForm.sGauge1.Suffix := '% | Создано файлов: ' + IntToStr(CurrentFileId);
   end;

   ShellExecute(Handle, 'explore', PChar(resultdir), nil, nil, SW_SHOWNORMAL);

   except
    on E : Exception do
        MessageBox(Handle, PChar(E.ClassName + ' поднята ошибка при разделении файла, с сообщением : ' + E.Message), 'Информация', MB_ICONQUESTION);
  end;
end;

end.
