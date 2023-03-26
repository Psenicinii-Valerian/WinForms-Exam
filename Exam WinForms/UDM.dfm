object DM: TDM
  OldCreateOrder = False
  Height = 643
  Width = 849
  object Qstudent: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'SELECT S.NUME + '#39' '#39' + S.PRENUME AS STUDENT, (CASE GEN WHEN 0 THE' +
        'N '#39'FEMININ'#39' WHEN 1 THEN '#39'MASCULIN'#39' END) AS GEN, S.IDNP, S.DATA_N' +
        'ASTERII, G.NUME AS GRUPA, G.LIMBA AS LIMBA, '
      'SS.NUME AS SPECIALITATE, * FROM STUDENT S'
      '   INNER JOIN GRUPA G ON G.GRUPA_ID = S.GRUPA_ID'
      
        '   INNER JOIN SPECIALITATE SS ON SS.SPECIALITATE_ID = G.SPECIALI' +
        'TATE_ID'
      
        '   INNER JOIN EXAMINARE EX ON EX.SPECIALITATEA_ID = SS.SPECIALIT' +
        'ATE_ID'
      '   INNER JOIN LECTOR L ON L.LECTOR_ID = EX.LECTOR_ID'
      
        '  WHERE L.LECTOR_ID = :LECTOR_ID AND EX.EXAMINARE_ID = :EXAMINAR' +
        'E_ID '
      'ORDER BY S.NUME'
      '')
    Left = 184
    Top = 136
    ParamData = <
      item
        Name = 'LECTOR_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EXAMINARE_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object Baza: TFDConnection
    Params.Strings = (
      'DriverID=oDBC'
      'DataSource=Student')
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 72
  end
  object DSQstudent: TDataSource
    DataSet = Qstudent
    Left = 256
    Top = 136
  end
  object Student_ins: TFDQuery
    Connection = Baza
    SQL.Strings = (
      'INSERT INTO STUDENT '
      '(NUME, PRENUME, DATA_NASTERII, IDNP, GEN, GRUPA_ID)'
      'VALUES(:NUME, :PRENUME, :DATA_NASTERII, :IDNP, :GEN, :GRUPA_ID)')
    Left = 184
    Top = 200
    ParamData = <
      item
        Name = 'NUME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRENUME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_NASTERII'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDNP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'GEN'
        ParamType = ptInput
      end
      item
        Name = 'GRUPA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object Student_del: TFDQuery
    Connection = Baza
    SQL.Strings = (
      'DELETE STUDENT'
      #9'WHERE STUDENT_ID = :STUDENT_ID')
    Left = 328
    Top = 200
    ParamData = <
      item
        Name = 'STUDENT_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object Qgrupa: TFDQuery
    Connection = Baza
    SQL.Strings = (
      'SELECT GRUPA_ID, NUME AS GRUPA, LIMBA FROM GRUPA')
    Left = 184
    Top = 72
  end
  object DSQgrupa: TDataSource
    DataSet = Qgrupa
    Left = 256
    Top = 72
  end
  object Student_upd: TFDQuery
    Connection = Baza
    SQL.Strings = (
      'UPDATE STUDENT SET GRUPA_ID=:GRUPA_ID,'
      #9'           NUME=:NUME,'
      #9#9'   PRENUME=:PRENUME,'#9#9'   '
      '                   DATA_NASTERII=:DATA_NASTERII,'
      '                   IDNP=:IDNP,'
      '                   GEN=:GEN'
      'WHERE STUDENT_ID =:STUDENT_ID')
    Left = 256
    Top = 200
    ParamData = <
      item
        Name = 'GRUPA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRENUME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_NASTERII'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDNP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'GEN'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STUDENT_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QLiber: TFDQuery
    Connection = Baza
    Left = 104
    Top = 136
  end
  object QAutentificare: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'SELECT *, NUME + '#39' '#39' + PRENUME AS LECTOR FROM LECTOR L INNER JOI' +
        'N EXAMINARE EX ON EX.LECTOR_ID = L.LECTOR_ID'
      #9'WHERE LOGIN = :LOGGIN AND PASSWORD = :PASS')
    Left = 184
    Top = 264
    ParamData = <
      item
        Name = 'LOGGIN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object QIdentificare: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'SELECT S.NUME + '#39' '#39' + S.PRENUME AS STUDENT, * FROM STUDENT S INN' +
        'ER JOIN GRUPA G ON G.GRUPA_ID = S.GRUPA_ID'
      #9#9#9#9#9#9#9'     INNER JOIN NOTA N ON N.STUDENT_ID = S.STUDENT_ID'
      
        #9#9#9#9#9#9#9'     INNER JOIN EXAMINARE EX ON EX.EXAMINARE_ID = N.EXAMI' +
        'NARE_ID'
      #9#9#9#9#9#9#9'     INNER JOIN LECTOR L ON L.LECTOR_ID = EX.LECTOR_ID'
      '  WHERE G.NUME = :NUME AND L.LECTOR_ID = :LECTOR')
    Left = 184
    Top = 328
    ParamData = <
      item
        Name = 'NUME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LECTOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QCautare: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'SELECT S.NUME, S.PRENUME, S.DATA_NASTERII, F.NUME, SS.NUME, G.NU' +
        'ME FROM STUDENT S INNER JOIN GRUPA G ON G.GRUPA_ID = S.GRUPA_ID '
      
        '                                                                ' +
        '   INNER JOIN SPECIALITATE SS ON SS.SPECIALITATE_ID = G.SPECIALI' +
        'TATE_ID '
      
        '                                                                ' +
        '   INNER JOIN FACULTATE F ON F.FACULTATE_ID = SS.FACULTATE_ID')
    Left = 184
    Top = 392
  end
  object DSQCautare: TDataSource
    DataSet = QCautare
    Left = 256
    Top = 392
  end
  object QRaportMedia: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'SELECT S.NUME, S.PRENUME, IIF (S.GEN = 1, '#39'MASCULIN'#39', '#39'FEMININ'#39')' +
        ' AS GEN, S.IDNP, G.NUME AS GRUPA,'
      
        #9'(SELECT CONVERT(DECIMAL(7,2), AVG(N.NOTA)) FROM NOTA N INNER JO' +
        'IN STUDENT S ON S.STUDENT_ID = N.STUDENT_ID'
      #9#9#9#9#9#9#9'       INNER JOIN GRUPA GG ON GG.GRUPA_ID = S.GRUPA_ID'
      #9#9#9'WHERE G.GRUPA_ID = GG.GRUPA_ID) AS MEDIA_GRUPA,'
      ''
      
        #9'(SELECT CONVERT(DECIMAL(7,2), AVG(N.NOTA)) FROM NOTA N INNER JO' +
        'IN STUDENT SS ON SS.STUDENT_ID = N.STUDENT_ID'
      #9#9#9'WHERE SS.STUDENT_ID = S.STUDENT_ID) AS MEDIA_STUDENT'
      ''
      #9'FROM STUDENT S INNER JOIN NOTA N ON N.STUDENT_ID = S.STUDENT_ID'
      #9#9'       INNER JOIN GRUPA G ON G.GRUPA_ID = S.GRUPA_ID'
      
        #9'               INNER JOIN EXAMINARE EX ON EX.EXAMINARE_ID = N.E' +
        'XAMINARE_ID'
      
        #9#9'       INNER JOIN DISCIPLINA D ON D.DISCIPLINA_ID = EX.DISCIPL' +
        'INA_ID'
      'WHERE G.NUME = :GRUPA'
      
        'GROUP BY S.NUME, S.PRENUME, IIF (S.GEN = 1, '#39'MASCULIN'#39', '#39'FEMININ' +
        #39'), S.IDNP, G.NUME, G.GRUPA_ID, S.STUDENT_ID'
      'ORDER BY S.NUME ASC')
    Left = 184
    Top = 456
    ParamData = <
      item
        Name = 'GRUPA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object frxReportMedia: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44931.554434953700000000
    ReportOptions.LastChange = 44931.612942951390000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportMediaGetValue
    Left = 464
    Top = 72
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'GRUPA'
        Value = ''
      end
      item
        Name = 'MEDIA'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 105.826840000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Top = 26.456710000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nume')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 132.283550000000000000
          Top = 26.456710000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Prenume')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 245.669450000000000000
          Top = 26.456710000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Gen')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 359.055350000000000000
          Top = 26.456710000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'IDNP')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 623.622450000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Grupa')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 491.338900000000000000
          Top = 26.456710000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Media student')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 166.299320000000000000
          Top = 18.897650000000000000
          Width = 389.291590000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Raportul mediei studentilor grupei [GRUPA]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo10: TfrxMemoView
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NUME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."NUME"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 132.283550000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'PRENUME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."PRENUME"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 245.669450000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'GEN'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."GEN"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 359.055350000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'IDNP'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."IDNP"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 491.338900000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'MEDIA_STUDENT'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."MEDIA_STUDENT"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."GRUPA"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 75.590600000000000000
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 219.212740000000000000
          Top = 30.236240000000000000
          Width = 302.362400000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'Media grupei [GRUPA] este = [MEDIA]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QRaportMedia
    BCDToCurrency = False
    Left = 560
    Top = 72
  end
  object frxReportExaminare: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44931.554434953700000000
    ReportOptions.LastChange = 44931.731530729160000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportExaminareGetValue
    Left = 464
    Top = 136
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'ECTS'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header4: TfrxHeader
        FillType = ftBrush
        Height = 166.299320000000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Left = 113.385900000000000000
          Top = 15.118120000000000000
          Width = 37.795300000000000000
          Height = 151.181200000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nr.'
            'crt.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 151.181200000000000000
          Top = 15.118120000000000000
          Width = 151.181200000000000000
          Height = 151.181200000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nume, prenume')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 302.362400000000000000
          Top = 15.118120000000000000
          Width = 188.976500000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nota')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 302.362400000000000000
          Top = 41.574830000000000000
          Width = 151.181200000000000000
          Height = 124.724490000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'In sistemul '
            'national, trunchiata*')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 453.543600000000000000
          Top = 41.574830000000000000
          Width = 37.795300000000000000
          Height = 124.724490000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'conform '
            'scalei ECTS')
          ParentFont = False
          Rotation = 90
          VAlign = vaBottom
        end
        object Memo15: TfrxMemoView
          Left = 491.338900000000000000
          Top = 15.118120000000000000
          Width = 151.181200000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Semnatura')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 491.338900000000000000
          Top = 41.574830000000000000
          Width = 75.590600000000000000
          Height = 124.724490000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'examinator')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 566.929500000000000000
          Top = 41.574830000000000000
          Width = 75.590600000000000000
          Height = 124.724490000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'asistent')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 514.016080000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo18: TfrxMemoView
          Left = 113.385900000000000000
          Width = 37.795300000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 151.181200000000000000
          Width = 151.181200000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."NUME"]  [frxDBDataset1."PRENUME"] ')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo20: TfrxMemoView
          Left = 302.362400000000000000
          Width = 151.181200000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          DataField = 'NOTA'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."NOTA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 453.543600000000000000
          Width = 37.795300000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[ECTS]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 491.338900000000000000
          Width = 75.590600000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 566.929500000000000000
          Width = 75.590600000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 185.196970000000000000
        Top = 79.370130000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 185.196970000000000000
          Top = 3.779530000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Borderou de examinare (invatamant cu frecventa)')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 26.456710000000000000
          Top = 102.047310000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Grupa:                             ')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 264.567100000000000000
          Top = 117.165430000000000000
          Width = 196.535560000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 71.811070000000000000
          Top = 117.165430000000000000
          Width = 79.370130000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo8: TfrxMemoView
          Left = 196.535560000000000000
          Top = 102.047310000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Disciplina:                    ')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 26.456710000000000000
          Top = 151.181200000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Examinator:                             ')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 597.165740000000000000
          Top = 151.181200000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Data:              .2022')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Left = 102.047310000000000000
          Top = 166.299320000000000000
          Width = 132.283550000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Left = 634.961040000000000000
          Top = 166.299320000000000000
          Width = 86.929190000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          Left = 26.456710000000000000
          Top = 56.692950000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Facultatea:                             ')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 98.267780000000000000
          Top = 71.811070000000000000
          Width = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Left = 196.535560000000000000
          Top = 56.692950000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Specialitatea:'
            '                           ')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 279.685220000000000000
          Top = 71.811070000000000000
          Width = 196.535560000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo5: TfrxMemoView
          Left = 548.031850000000000000
          Top = 56.692950000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Anul de studii/Sem:')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 668.976810000000000000
          Top = 71.811070000000000000
          Width = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 249.448980000000000000
          Top = 11.338590000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'UNIVERSITATEA .......................')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 185.196970000000000000
        Top = 608.504330000000000000
        Width = 718.110700000000000000
        object Memo24: TfrxMemoView
          Top = 71.811070000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nota')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 64.252010000000000000
          Top = 71.811070000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '9,01 - 10,0')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 139.842610000000000000
          Top = 71.811070000000000000
          Width = 71.811070000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '8,01 - 9,0')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 211.653680000000000000
          Top = 71.811070000000000000
          Width = 71.811070000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '7,01 - 8,0')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 283.464750000000000000
          Top = 71.811070000000000000
          Width = 71.811070000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '6,01 - 7,0')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 355.275820000000000000
          Top = 71.811070000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '5,0 - 6,0')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 419.527830000000000000
          Top = 71.811070000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '3,01 - 4,99')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 495.118430000000000000
          Top = 71.811070000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '1,0 - 3,0')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 559.370440000000000000
          Top = 71.811070000000000000
          Width = 79.370130000000000000
          Height = 75.590600000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nu s-au'
            'prezentat')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 638.740570000000000000
          Top = 71.811070000000000000
          Width = 79.370130000000000000
          Height = 75.590600000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nu au fost'
            'admisi')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Top = 109.606370000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Notarea '
            'ECTS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 64.252010000000000000
          Top = 109.606370000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'A')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 139.842610000000000000
          Top = 109.606370000000000000
          Width = 71.811070000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'B')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 211.653680000000000000
          Top = 109.606370000000000000
          Width = 71.811070000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'C')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 283.464750000000000000
          Top = 109.606370000000000000
          Width = 71.811070000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'D')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 355.275820000000000000
          Top = 109.606370000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'E')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 419.527830000000000000
          Top = 109.606370000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'FX')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 495.118430000000000000
          Top = 109.606370000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'F')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Top = 147.401670000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Numarul'
            'total')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 64.252010000000000000
          Top = 147.401670000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 139.842610000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 211.653680000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 283.464750000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 355.275820000000000000
          Top = 147.401670000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 419.527830000000000000
          Top = 147.401670000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 495.118430000000000000
          Top = 147.401670000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 559.370440000000000000
          Top = 147.401670000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 638.740570000000000000
          Top = 147.401670000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QRaportDisciplina
    BCDToCurrency = False
    Left = 560
    Top = 136
  end
  object QRaportDisciplina: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'SELECT S.NUME, S.PRENUME, G.NUME AS GRUPA, F.NUME AS FACULTATEA,' +
        ' SS.NUME AS SPECIALITATEA, D.NUME AS DISCIPLINA, L.NUME AS EXAMI' +
        'NATOR, EX.DATA_EXAMINARII, N.NOTA'
      ''
      #9'FROM STUDENT S INNER JOIN GRUPA G ON G.GRUPA_ID = S.GRUPA_ID'
      #9#9#9#9'   INNER JOIN NOTA N ON N.STUDENT_ID = S.STUDENT_ID'
      
        #9#9#9#9'   INNER JOIN EXAMINARE EX ON EX.EXAMINARE_ID = N.EXAMINARE_' +
        'ID'
      
        #9#9#9#9'   INNER JOIN DISCIPLINA D ON D.DISCIPLINA_ID = EX.DISCIPLIN' +
        'A_ID'
      
        #9#9#9#9'   INNER JOIN SPECIALITATE SS ON SS.SPECIALITATE_ID = EX.SPE' +
        'CIALITATEA_ID'
      
        #9#9#9#9'   INNER JOIN FACULTATE F ON F.FACULTATE_ID = SS.FACULTATE_I' +
        'D'
      #9#9#9#9'   INNER JOIN LECTOR L ON L.LECTOR_ID = EX.LECTOR_ID'
      
        'WHERE D.NUME = :DISCIPLINA AND G.NUME = :GRUPA AND EX.DATA_EXAMI' +
        'NARII = :DATA_EXAMINARII'
      'ORDER BY S.NUME ASC')
    Left = 184
    Top = 576
    ParamData = <
      item
        Name = 'DISCIPLINA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'GRUPA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_EXAMINARII'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object DSQDisciplina: TDataSource
    DataSet = QDisciplina
    Left = 256
    Top = 520
  end
  object QDisciplina: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'SELECT S.NUME, S.PRENUME, G.NUME AS GRUPA, F.NUME AS FACULTATEA,' +
        ' SS.NUME AS SPECIALITATEA, D.NUME AS DISCIPLINA, L.NUME AS EXAMI' +
        'NATOR, EX.DATA_EXAMINARII,'
      ''
      
        #9'   (SELECT COUNT(DISTINCT(S.STUDENT_ID)) FROM STUDENT S INNER J' +
        'OIN GRUPA GG ON GG.GRUPA_ID = S.GRUPA_ID'
      #9#9#9#9#9#9#9#9#9'   INNER JOIN NOTA NN ON NN.STUDENT_ID = S.STUDENT_ID'
      
        #9#9#9#9#9#9#9#9#9'   INNER JOIN SPECIALITATE SSS ON SSS.SPECIALITATE_ID =' +
        ' GG.SPECIALITATE_ID'
      
        #9#9#9#9#9#9#9#9#9'   INNER JOIN EXAMINARE EXX ON EXX.SPECIALITATEA_ID = S' +
        'SS.SPECIALITATE_ID'
      
        #9#9#9#9#9#9#9#9#9'   INNER JOIN DISCIPLINA DD ON DD.DISCIPLINA_ID = EXX.D' +
        'ISCIPLINA_ID'
      
        #9#9#9'WHERE G.NUME = GG.NUME AND DD.NUME = D.NUME AND EXX.DATA_EXAM' +
        'INARII = EXX.DATA_EXAMINARII AND NN.NOTA_ID = N.NOTA_ID) AS STUD' +
        'ENTI '
      ''
      'FROM STUDENT S INNER JOIN GRUPA G ON G.GRUPA_ID = S.GRUPA_ID'
      #9#9#9'   INNER JOIN NOTA N ON N.STUDENT_ID = S.STUDENT_ID'
      
        #9#9#9'   INNER JOIN EXAMINARE EX ON EX.EXAMINARE_ID = N.EXAMINARE_I' +
        'D'
      
        #9#9#9'   INNER JOIN DISCIPLINA D ON D.DISCIPLINA_ID = EX.DISCIPLINA' +
        '_ID'
      
        #9#9#9'   INNER JOIN SPECIALITATE SS ON SS.SPECIALITATE_ID = EX.SPEC' +
        'IALITATEA_ID'
      #9#9#9'   INNER JOIN FACULTATE F ON F.FACULTATE_ID = SS.FACULTATE_ID'
      #9#9#9'   INNER JOIN LECTOR L ON L.LECTOR_ID = EX.LECTOR_ID'
      ''
      
        'WHERE (SELECT COUNT(DISTINCT(S.STUDENT_ID)) FROM STUDENT S INNER' +
        ' JOIN GRUPA GG ON GG.GRUPA_ID = S.GRUPA_ID'
      #9#9#9#9#9#9#9#9#9'   INNER JOIN NOTA NN ON NN.STUDENT_ID = S.STUDENT_ID'
      
        #9#9#9#9#9#9#9#9#9'   INNER JOIN SPECIALITATE SSS ON SSS.SPECIALITATE_ID =' +
        ' GG.SPECIALITATE_ID'
      
        #9#9#9#9#9#9#9#9#9'   INNER JOIN EXAMINARE EXX ON EXX.SPECIALITATEA_ID = S' +
        'SS.SPECIALITATE_ID'
      
        #9#9#9#9#9#9#9#9#9'   INNER JOIN DISCIPLINA DD ON DD.DISCIPLINA_ID = EXX.D' +
        'ISCIPLINA_ID'
      
        #9#9#9'WHERE G.NUME = GG.NUME AND DD.NUME = D.NUME AND EXX.DATA_EXAM' +
        'INARII = EXX.DATA_EXAMINARII AND NN.NOTA_ID = N.NOTA_ID) > 0'
      'ORDER BY D.NUME ASC')
    Left = 184
    Top = 521
  end
end
