#Include 'Protheus.ch'
#Include 'TBICONN.ch'




// ***************************************************************
User Function xPar()
	
	Local cAlert := "MsgInfo(cNome)"
	Local lCon := .F.
	Local CNome := ""
	
	If Select("SX2") = 0
		PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA1' MODULO 'FAT'
		LCon := .T.
	EndIf

	cNome := GetMv("XX_NOME")
	
	MsgInfo(cNome)
	//&cAlert
	
	PutMv("XX_NOME","CONTEUDO NOVO DO PARAMETRO XX_NOME")
	
	MsgInfo( GetMv("XX_NOME") )
	
	
	If lCon
		RESET ENVIRONMENT
	EndIf

Return( NIL )




// ***************************************************************

User Function xMacro1()
	
	Local cAlert := "msginfo('Macro')"
	Local cSoma := "20 + 10"
	Local cCampo := "A1_COD"
	Local lCon := .F.
	
	// o prefixo "&" executa o conteudo da variavel!!!
	//&cAlert
	
	//PREPARA UM AMBIENTE
	
	If Select("SX2") = 0
		PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA1' MODULO 'FAT'
		LCon := .T.
	EndIf

	dbSelectArea("SA1")
	
	ConOut( cCampo + " // " + &cCampo )
	
	If lCon
		RESET ENVIRONMENT
	EndIf
	
	//MsgInfo("Rodou")
	
	//MsgInfo("Rodou de novo")
	
Return ( NIL )

// ***************************************************************

User Function xMacro()
	
	Local cAlert := "msginfo('Macro')"
	Local cSoma := "20 + 10"
	
	// o prefixo "&" executa o conteudo da variavel!!!
	
	&cAlert
	
	MsgInfo(cSoma + " = " + cValToChar( &cSoma ) )
	


Return ( NIL )

// ***************************************************************
User Function tFun2()

	Local cNome := "Nome declarado"
	Local nIdade := 50
	Local cSexo := "M"
		
	fNome3(@cNome,@nIdade ,@cSexo)
	
	cNome := fNome4(cNome)
	
	MsgInfo(cNome)
	
	fNome(1,2,3)
	
	MsgInfo("Nome: " + cNome + " Idade: " + cValToChar(nIdade) + "  Sexo: " + cSexo)

Return( NIL )

// ---------------------------------------------------------------

Static Function fNome3(pNOme, pIdade, pSexo)
	
	pNome += " Sobrenome"
	pIdade := 10
	pSexo := "F"

Return( NIL )

Static Function fNome4(pNome)
	
	pNome += " Sobrenome"


Return( pNome )

// ***************************************************************
User Function tFun1()

	Local cNome := "Nome declarado"
	Local nIdade := 50
	Local cSexo := "M"
	Local rNome := ""
	
	rArray := fNome2(cNome, ,cSexo)
	
	MsgInfo("Nome: " + rArray[1] + " Idade: " + cValToChar(rArray[2]) + "  Sexo: " + rArray[3])

Return()

// ---------------------------------------------------------------

Static Function fNome2(pNome,pIdade,pSexo)
	
	default pIdade := 0
	
	pNome += " Sobrenome"
	
	//MsgInfo("Nome: " + pNome + " Idade: " + cValToChar(pIdade))
	
	rrArray := {pNome,pIdade,pSexo}

Return( rrArray )


// ***************************************************************

User Function tFun()

	Local cNome := fNome()
	
	MsgInfo("Retorno da funcao: " + cNome)

Return ( NIL )

// ---------------------------------------------------------------

Static Function fNome()

	Local cRet := "NOMDE DECALRADO NA FUNC"
	
Return ( cRet )

// ***************************************************************