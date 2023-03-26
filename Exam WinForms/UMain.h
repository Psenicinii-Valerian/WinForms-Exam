//---------------------------------------------------------------------------

#ifndef UMainH
#define UMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <System.ImageList.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.Imaging.pngimage.hpp>
#include <Vcl.Buttons.hpp>
#include <Data.DB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label2;
	TPanel *Panel1;
	TPanel *Panel3;
	TPanel *Panel2;
	TImageList *ImageList1;
	TImage *Image2;
	TTimer *Timer1;
	TPageControl *Stud;
	TTabSheet *Autentificare;
	TPanel *Panel4;
	TPanel *Panel5;
	TImage *Image1;
	TLabel *Label3;
	TSpeedButton *SpeedButton1;
	TSpeedButton *SpeedButton3;
	TEdit *Edit1;
	TEdit *Edit2;
	TTabSheet *Manager;
	TPanel *Panel6;
	TPanel *Panel8;
	TPanel *Panel7;
	TDBGrid *DBGrid1;
	TTabSheet *Grupa;
	TPanel *Panel9;
	TPanel *Panel10;
	TSpeedButton *SpeedButton5;
	TSpeedButton *SpeedButton6;
	TPanel *Panel11;
	TDBGrid *DBGrid2;
	TTabSheet *Cautare;
	TPanel *Panel12;
	TPanel *Panel13;
	TCheckBox *CheckBox11;
	TEdit *Edit9;
	TCheckBox *CheckBox12;
	TEdit *Edit10;
	TCheckBox *CheckBox13;
	TDateTimePicker *DateTimePicker3;
	TComboBox *ComboBox4;
	TCheckBox *CheckBox14;
	TCheckBox *CheckBox15;
	TComboBox *ComboBox5;
	TComboBox *ComboBox6;
	TCheckBox *CheckBox16;
	TDBGrid *DBGrid3;
	TPageControl *PageControl1;
	TTabSheet *Main_C;
	TSpeedButton *SpeedButton13;
	TSpeedButton *SpeedButton14;
	TSpeedButton *SpeedButton15;
	TSpeedButton *SpeedButton7;
	TTabSheet *Ins_C;
	TLabel *Label4;
	TLabel *Label5;
	TLabel *Label6;
	TLabel *Label7;
	TSpeedButton *SpeedButton10;
	TSpeedButton *SpeedButton12;
	TSpeedButton *SpeedButton2;
	TDateTimePicker *DateTimePicker1;
	TEdit *Edit4;
	TEdit *Edit5;
	TEdit *Edit6;
	TEdit *Edit13;
	TEdit *Edit3;
	TCheckBox *CheckBox1;
	TCheckBox *CheckBox2;
	TTabSheet *Edit_C;
	TLabel *Label16;
	TLabel *Label17;
	TLabel *Label18;
	TLabel *Label19;
	TSpeedButton *SpeedButton8;
	TSpeedButton *SpeedButton9;
	TSpeedButton *SpeedButton4;
	TEdit *Edit18;
	TEdit *Edit19;
	TEdit *Edit21;
	TDateTimePicker *DateTimePicker4;
	TEdit *Edit22;
	TCheckBox *CheckBox3;
	TCheckBox *CheckBox4;
	TSpeedButton *SpeedButton11;
	TSpeedButton *SpeedButton16;
	TSpeedButton *SpeedButton17;
	TSpeedButton *SpeedButton18;
	TSpeedButton *SpeedButton19;
	TTabSheet *Examinare;
	TPanel *Panel14;
	TSpeedButton *SpeedButton21;
	TSpeedButton *SpeedButton22;
	TDBGrid *DBGrid4;

	void __fastcall SpeedButton3Click(TObject *Sender);
	void __fastcall SpeedButton1Click(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	//void __fastcall SpeedButton4Click(TObject *Sender);
	void __fastcall SpeedButton10Click(TObject *Sender);
	void __fastcall Edit7Change(TObject *Sender);
	void __fastcall SpeedButton2Click(TObject *Sender);
	void __fastcall SpeedButton15Click(TObject *Sender);
	void __fastcall SpeedButton5Click(TObject *Sender);
	void __fastcall SpeedButton13Click(TObject *Sender);
	void __fastcall SpeedButton8Click(TObject *Sender);
	void __fastcall SpeedButton9Click(TObject *Sender);
	void __fastcall SpeedButton12Click(TObject *Sender);
	void __fastcall SpeedButton4Click(TObject *Sender);
	void __fastcall SpeedButton14Click(TObject *Sender);
	void __fastcall SpeedButton6Click(TObject *Sender);
	void __fastcall SpeedButton7Click(TObject *Sender);
	void __fastcall ComboBox4KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox5KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox6KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall SpeedButton11Click(TObject *Sender);
	void __fastcall SpeedButton16Click(TObject *Sender);
	void __fastcall SpeedButton17Click(TObject *Sender);
	void __fastcall SpeedButton18Click(TObject *Sender);
	void __fastcall SpeedButton19Click(TObject *Sender);
	void __fastcall SpeedButton22Click(TObject *Sender);
	void __fastcall SpeedButton21Click(TObject *Sender);



private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
