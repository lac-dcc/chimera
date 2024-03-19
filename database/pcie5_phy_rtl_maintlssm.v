module mainLTSSM  #(
parameter MAX_GEN = 5,
parameter DEVICETYPE=0,
parameter Width = 32,
parameter GEN1_PIPEWIDTH = 8 ,	
parameter GEN2_PIPEWIDTH = 8 ,	
parameter GEN3_PIPEWIDTH = 8 ,	
parameter GEN4_PIPEWIDTH = 8 ,	
parameter GEN5_PIPEWIDTH = 8 ,
parameter LANESNUMBER = 16)
(
    input clk,
    input reset,
    input [3:0] lpifStateRequest,
    input [4:0] numberOfDetectedLanesIn,
    input [7:0] linkNumberInTx,
    input [7:0] linkNumberInRx,
    input [7:0] rateIdIn,
    input upConfigureCapabilityIn,
    input writeNumberOfDetectedLanes,
    input writeLinkNumberTx,
    input writeLinkNumberRx,
    input writeUpconfigureCapability,
    input writeRateId,
    input finishTx,
    input finishRx,
    input [4:0] gotoTx,
    input [4:0] gotoRx,
    input forceDetect,
    /***************eq****************/
    input [47:0] ReceiverpresetHintDSPIn,
    input [63:0] TransmitterPresetHintDSPIn,
    input [47:0] ReceiverpresetHintUSPIn,
    input [63:0] TransmitterPresetHintUSPIn,
    input writeReceiverpresetHintDSP,
    input writeTransmitterPresetHintDSP,
    input writeReceiverpresetHintUSP,
    input writeTransmitterPresetHintUSP,
    input directed_speed_change_In,
    input write_directed_speed_change,
    input [18*16 -1:0]LocalTxPresetCoefficients,
    input [6*16 -1:0]LocalFS,
    input [6*16 -1:0]LocalLF,
    input [16 -1:0]LocalTxCoefficientsValid,
    input [6*16 -1:0]LinkEvaluationFeedbackDirectionChange,
    input [16*6-1:0]FSDSP,
    input [16*6-1:0]LFDSP,
    input turnOffScrambler_flag,
    output	reg[18*16 -1:0]TxDeemph,
    output  reg[4*16 -1:0]LocalPresetIndex,
    output 	reg[16 -1:0]GetLocalPresetCoeffcients,
    output 	reg[6*16 -1:0]LF,
    output 	reg[6*16 -1:0]FS,
    output 	reg[16 -1:0]RxEqEval,
    output 	reg[16 -1:0]InvalidRequest,
    output  reg directed_speed_change,
    output  reg[47:0] ReceiverpresetHintDSP,
    output  reg[63:0] TransmitterPresetHintDSP,
    output  reg[47:0] ReceiverpresetHintUSP,
    output  reg[63:0] TransmitterPresetHintUSP,
    output  reg[6*16-1:0]LF_register,
    output  reg[6*16-1:0]FS_register,
    output  reg[6*16-1:0]CursorCoff,
    output  reg[6*16-1:0]PreCursorCoff,
    output  reg[6*16-1:0]PostCursorCoff, 
    /***************eq****************/
    output reg linkUp,
    output reg[2:0] GEN,
    output [4:0] numberOfDetectedLanesOut,
    output [7:0] linkNumberOutTx,
    output [7:0] linkNumberOutRx,
    output [7:0] rateIdOut,
    output upConfigureCapabilityOut,
    output reg[3:0] lpifStateStatus,
    output reg[4:0] substateTx,
    output reg[4:0] substateRx,
    output reg[1:0] width,
    output reg[2:0] trainToGen,
    output reg disableScrambler,
    output reg [4:0] PCLKRate,
    output reg startSend16);
//local signals
    reg [4:0] numberOfDetectedLanes;
    reg [7:0] linkNumber;
    reg [7:0] rateId;
    reg upConfigureCapability;
    reg [3:0]currentState,nextState;
    reg [4:0] substateTxnext,substateRxnext;
    integer i;
    
//Local parameters
    //LPIF STATES
    localparam[3:0]
        reset_   = 4'd0,
        active_  = 4'd1,
        retrain_ = 4'd11;

    //Tx/Rx LTSSM states
    localparam [4:0]
	    detectQuiet =  5'd0,
        detectActive = 5'd1,
        pollingActive= 5'd2,
        pollingConfiguration= 5'd3,
        configurationLinkWidthStart = 5'd4,
        configurationLinkWidthAccept = 5'd5,
        configurationLanenumWait = 5'd6,
        configurationLanenumAccept = 5'd7,
        configurationComplete = 5'd8,
        configurationIdle = 5'd9,
        L0 = 5'd10,
        recoveryRcvrLock = 5'd11,
        recoveryRcvrCfg = 5'd12,
        recoverySpeed = 5'd13,
        phase0 = 5'd14,
        phase1 = 5'd15,
        phase2 = 5'd16,
        phase3 =5'd17,
        recoveryIdle = 5'd18,
        recoverySpeedeieos = 5'd19,
        recoverywait = 5'd20;


    always @(posedge clk) 
    begin
        if(turnOffScrambler_flag)disableScrambler<=1'b1;
        else disableScrambler<=1'b0;      
    end

    always @(posedge clk or negedge reset)
    begin
        if(!reset || forceDetect)
        begin
            currentState <= reset_;
            ReceiverpresetHintDSP<=48'hAABBCCDD1122;
            TransmitterPresetHintDSP<=64'h11AA22BB33CC44DD;
            ReceiverpresetHintUSP<=48'h2211DDCCBBAA;
            TransmitterPresetHintUSP<=64'h11AA22BB33CC44DD;
            GEN <= 3'd1;
            
        end
        else
        begin
            currentState <= nextState;
            substateTx <= substateTxnext;
            substateRx <= substateRxnext;
            if(writeNumberOfDetectedLanes)numberOfDetectedLanes<=numberOfDetectedLanesIn;
            if(writeLinkNumberTx)linkNumber<=linkNumberInTx;
            else if(writeLinkNumberRx)linkNumber<=linkNumberInRx;
            if(writeUpconfigureCapability)upConfigureCapability<=upConfigureCapabilityIn;
            if(writeReceiverpresetHintDSP)ReceiverpresetHintDSP <=ReceiverpresetHintDSPIn;
            if(writeReceiverpresetHintUSP)ReceiverpresetHintUSP <=ReceiverpresetHintUSPIn;
            if(writeTransmitterPresetHintUSP) TransmitterPresetHintUSP<=TransmitterPresetHintUSPIn;
            if(writeTransmitterPresetHintDSP)TransmitterPresetHintDSP <=TransmitterPresetHintDSPIn;
            if(write_directed_speed_change) directed_speed_change <= directed_speed_change_In;
            if(writeRateId)rateId <= rateIdIn;
        end    
    end

//next LPIF state handling
    always @(*)
    begin
       case (currentState)
        reset_:
        begin
            if(finishTx&&gotoTx==L0&&finishRx&&gotoRx==L0&&lpifStateRequest==active_)
            begin
                nextState <= active_;
            end
        end
        active_:
        begin
            if(lpifStateRequest==reset_)
            begin
               nextState <= reset_; 
            end
            else if(lpifStateRequest==retrain_ || trainToGen >= 3'd2)
            begin
               nextState <= retrain_; 
            end
        end
        retrain_:
        begin
            if(finishTx&&gotoTx==L0&&finishRx&&gotoRx==L0)
            begin
               nextState <= active_; 
            end
        end 
        default:
            nextState <= reset_; 
       endcase 
        
    end

//check on gneration and adjust width reg 0 for 8bit 1 for 16bit 2 for 32bit
always @ (posedge clk)
begin 
	if(!reset) begin width <= 0; end
	else begin
		if (GEN == 1)begin  
			case(GEN1_PIPEWIDTH)
			8:width<=0;
			16:width<=1;
			32:width<=2;
			endcase
		end
		else if (GEN == 2)begin  
			case(GEN2_PIPEWIDTH)
			8:width<=0;
			16:width<=1;
			32:width<=2;
			endcase
		end
		else if (GEN == 3)begin  
			case(GEN3_PIPEWIDTH)
			8:width<=0;
			16:width<=1;
			32:width<=2;
			endcase
		end
		else if (GEN == 4)begin  
			case(GEN4_PIPEWIDTH)
			8:width<=0;
			16:width<=1;
			32:width<=2;
			endcase
		end
		else if (GEN == 5)begin  
			case(GEN5_PIPEWIDTH)
			8:width<=0;
			16:width<=1;
			32:width<=2;
			endcase
		end
		
	end
end

//output handling block
    always @(*)
    begin
        //disableScrambler = 1'b1;
       case (currentState)
        reset_:
        begin
            case ({substateTx,substateRx})
                {detectQuiet,detectQuiet}:
                begin
                   if (/*finishTx&&*/finishRx&&/*gotoTx==detectActive&&*/gotoRx==detectActive) 
                    begin
                        {substateTxnext,substateRxnext} = {detectActive,detectActive};
                        lpifStateStatus = reset_;
                    end 
                end
                
                {detectActive,detectActive}:
                begin
                    if (finishTx&&finishRx&&gotoTx==pollingActive&&gotoRx==pollingActive) 
                        begin
                            {substateTxnext,substateRxnext} = {pollingActive,pollingActive};
                            lpifStateStatus = reset_;
                        end
                    else if((finishTx&&gotoTx==detectQuiet)||(finishRx&&gotoRx==detectQuiet))
                        begin
                            {substateTxnext,substateRxnext}= {detectQuiet,detectQuiet};
                            lpifStateStatus = reset_;
                        end
                end

                {pollingActive,pollingActive}:
                begin
                    if ((finishRx&&gotoRx==pollingConfiguration) ||(gotoTx==pollingConfiguration&&finishTx)) 
                        begin
                            {substateTxnext,substateRxnext}= {pollingConfiguration,pollingConfiguration};
                            lpifStateStatus = reset_;
                        end
                    else if((finishTx&&gotoTx==detectQuiet)||(finishRx&&gotoRx==detectQuiet))
                        begin
                            {substateTxnext,substateRxnext}= {detectQuiet,detectQuiet};
                            lpifStateStatus = reset_;
                        end
                end
                {pollingConfiguration,pollingConfiguration}:
                begin
                    if (finishTx&&finishRx&&gotoTx==configurationLinkWidthStart&&gotoRx==configurationLinkWidthStart) 
                        begin
                            {substateTxnext,substateRxnext}= {configurationLinkWidthStart,configurationLinkWidthStart};
                            lpifStateStatus = reset_;
                        end
                    else if((finishTx&&gotoTx==detectQuiet)||(finishRx&&gotoRx==detectQuiet))
                        begin
                            {substateTxnext,substateRxnext}= {detectQuiet,detectQuiet};
                            lpifStateStatus = reset_;
                        end
                end
                {configurationLinkWidthStart,configurationLinkWidthStart}:
                begin
                    if (finishRx&&gotoRx==configurationLinkWidthAccept) 
                        begin
                            {substateTxnext,substateRxnext}= {configurationLinkWidthAccept,configurationLinkWidthAccept};
                            lpifStateStatus = reset_;
                        end
                    else if((finishTx&&gotoTx==detectQuiet)||(finishRx&&gotoRx==detectQuiet))
                        begin
                            {substateTxnext,substateRxnext}= {detectQuiet,detectQuiet};
                            lpifStateStatus = reset_;
                        end
                end
                {configurationLinkWidthAccept,configurationLinkWidthAccept}:
                begin
                    if (!DEVICETYPE&&finishTx&&gotoTx==configurationLanenumWait)//in downstream the Rx doesn't make any thing 
                        begin
                            {substateTxnext,substateRxnext}= {configurationLanenumWait,configurationLanenumWait};
                            lpifStateStatus = reset_;
                        end
                    else if (DEVICETYPE&&finishTx&&finishRx&&gotoTx==configurationLanenumWait&&gotoRx==configurationLanenumWait) 
                        begin
                            {substateTxnext,substateRxnext}= {configurationLanenumWait,configurationLanenumWait};
                            lpifStateStatus = reset_;
                        end
                    else if((finishTx&&gotoTx==detectQuiet)||(finishRx&&gotoRx==detectQuiet))
                        begin
                            {substateTxnext,substateRxnext}= {detectQuiet,detectQuiet};
                            lpifStateStatus = reset_;
                        end
                end
                {configurationLanenumWait,configurationLanenumWait}:
                    if (finishRx&&gotoRx==configurationLanenumAccept) 
                        begin
                            {substateTxnext,substateRxnext}= {configurationLanenumAccept,configurationLanenumAccept};
                            lpifStateStatus = reset_;
                        end
                    else if((finishTx&&gotoTx==detectQuiet)||(finishRx&&gotoRx==detectQuiet))
                        begin
                            {substateTxnext,substateRxnext}= {detectQuiet,detectQuiet};
                            lpifStateStatus = reset_;
                        end
                {configurationLanenumAccept,configurationLanenumAccept}:
                    if (finishRx&&gotoRx==configurationComplete) 
                        begin
                            {substateTxnext,substateRxnext}= {configurationComplete,configurationComplete};
                            lpifStateStatus = reset_;
                        end
                    else if((finishTx&&gotoTx==detectQuiet)||(finishRx&&gotoRx==detectQuiet))
                        begin
                            {substateTxnext,substateRxnext}= {detectQuiet,detectQuiet};
                            lpifStateStatus = reset_;
                        end
                {configurationComplete,configurationComplete}:
                    if (finishRx&&gotoRx==configurationIdle&&finishTx&&gotoRx==configurationIdle) 
                        begin
                            {substateTxnext,substateRxnext}= {configurationIdle,configurationIdle};
                            lpifStateStatus = reset_;
                        end
                    else if((finishTx&&gotoTx==detectQuiet)||(finishRx&&gotoRx==detectQuiet))
                        begin
                            {substateTxnext,substateRxnext}= {detectQuiet,detectQuiet};
                            lpifStateStatus = reset_;
                        end
                {configurationIdle,configurationIdle}:
                begin
                    //disableScrambler = 1'b0;
                    if (finishRx&&gotoRx==L0)startSend16<= 1'b1;
                    if (finishTx&&gotoTx==L0) 
                        begin
                            linkUp = 1'b1;
                            startSend16 <= 1'b0;
                            lpifStateStatus = reset_;
                            {substateTx,substateRx} <= {L0,L0};//ERASE THE COMMENT IF I CAN GOT TO L0 WITHOUT LPIF PERMISSION
                        end
                    else if((finishTx&&gotoTx==detectQuiet)||(finishRx&&gotoRx==detectQuiet))
                        begin
                            {substateTxnext,substateRxnext}= {detectQuiet,detectQuiet};
                            lpifStateStatus = reset_;
                        end
                end
                    

                default:
                    begin
                        {substateTxnext,substateRxnext}= {detectQuiet,detectQuiet};
                        lpifStateStatus = reset_;
                        linkUp = 1'b0;
                        //pl_speedmode = 3'd0;
                    end
            
            endcase
        end
        active_:
        begin
            {substateTxnext,substateRxnext}= {L0,L0};
            lpifStateStatus = active_;
            linkUp = 1'b1;
            if((MAX_GEN==3'd3 && rateId[5:1] == 5'b00111)&&(GEN<3'd3)&&(!DEVICETYPE || (DEVICETYPE && finishRx &&gotoRx== recoveryRcvrLock)))
            begin
                directed_speed_change = 1'b1;
                trainToGen = 3'd3;
                {substateTxnext,substateRxnext}= {recoveryRcvrLock,recoveryRcvrLock};
                
            end
            else if((MAX_GEN==3'd2 && rateId[5:1] == 5'b00011)&&(GEN<3'd2)&&(!DEVICETYPE || (DEVICETYPE && finishRx &&gotoRx== recoveryRcvrLock)))
            begin
                directed_speed_change = 1'b1;
                trainToGen = 3'd2;
                {substateTxnext,substateRxnext}= {recoveryRcvrLock,recoveryRcvrLock};
            end             

            else if((MAX_GEN==3'd4 && rateId[5:1] == 5'b01111)&&(GEN<3'd4)&&(!DEVICETYPE || (DEVICETYPE && finishRx &&gotoRx== recoveryRcvrLock)))
            begin
                directed_speed_change = 1'b1;
                trainToGen = 3'd4;
                {substateTxnext,substateRxnext}= {recoveryRcvrLock,recoveryRcvrLock};
            end   

            else if((MAX_GEN==3'd5 && rateId[5:1] == 5'b11111)&&(GEN<3'd5)&&(!DEVICETYPE || (DEVICETYPE && finishRx &&gotoRx== recoveryRcvrLock)))
            begin
                directed_speed_change = 1'b1;
                trainToGen = 3'd5;
                {substateTxnext,substateRxnext}= {recoveryRcvrLock,recoveryRcvrLock};
            end   
                
                       
        end
        retrain_:
        begin
           lpifStateStatus = retrain_;
           linkUp = 1'b1;
           case({substateRx,substateTx})
                {recoveryRcvrLock,recoveryRcvrLock}:
                begin
                    if(finishRx && gotoRx == recoveryRcvrCfg)
                        {substateTxnext,substateRxnext}= {recoveryRcvrCfg,recoveryRcvrCfg};
                end
                {recoveryRcvrCfg,recoveryRcvrCfg}:
                begin
                    if(finishRx && gotoRx == recoverySpeed)
                        {substateTxnext,substateRxnext}= {recoverySpeed,recoverySpeed};

                    else if(finishRx && gotoRx == recoveryIdle)
                        {substateTxnext,substateRxnext}= {recoveryIdle,recoveryIdle};
                end
                {recoverySpeed,recoverySpeed}:
                begin
                    if((finishRx&&gotoRx==recoverywait))
                    begin
                        {substateTxnext,substateRxnext}= {recoverywait,recoverywait};
                        directed_speed_change = 1'b0;
                    end                       

                end
                {recoverywait,recoverywait}:
                begin
                    if((finishTx&&gotoTx==recoverySpeedeieos))
                    begin
                        {substateTxnext,substateRxnext}= {recoverySpeedeieos,recoverySpeedeieos};
                        GEN = trainToGen;
                        directed_speed_change = 1'b0;
                    end                       

                end

                {recoverySpeedeieos,recoverySpeedeieos}:
                begin
                    if(finishRx&&gotoRx==phase0)
                    begin
                        {substateTxnext,substateRxnext}= {phase0,phase0};
                    end
                    else if(finishRx&&gotoRx==recoveryRcvrLock)
                    begin
                        {substateTxnext,substateRxnext}= {recoveryRcvrLock,recoveryRcvrLock};
                    end                       

                end
                {phase0,phase0}:
                begin
                    //disableScrambler = 1'b0;
                    //mapping tx preset to coeff.
                    GetLocalPresetCoeffcients={16{1'b1}};
				    for(i=0;i<16;i=i+1)
                    begin
                        if(DEVICETYPE)
					        LocalPresetIndex[(4*16-4)-i*4+:4]=TransmitterPresetHintUSP[4*i+:4];
                        else
                            LocalPresetIndex[(4*16-4)-i*4+:4]=TransmitterPresetHintDSP[4*i+:4];
				    end

                    if(LocalTxCoefficientsValid=={16{1'b1}})
                    begin
                        for(i=0;i<16;i=i+1)
                        begin
                            PreCursorCoff[6*i+:6] =LocalTxPresetCoefficients[(18*16-18)-18*i+:6];//[23:18][5:0]       [35:0][17:0]
                            CursorCoff[6*i+:6]    =LocalTxPresetCoefficients[(18*16-18)-18*i+6+:6];//[29:24][11:6]
                            PostCursorCoff[6*i+:6]=LocalTxPresetCoefficients[(18*16-18)-18*i+12+:6];//[35:30][17:12]
                            LF_register[6*i+:6] = LocalLF[(6*LANESNUMBER-6)-6*i+:6];
                            FS_register[6*i+:6] = LocalFS[(6*LANESNUMBER-6)-6*i+:6];
					    end
                        TxDeemph =  LocalTxPresetCoefficients; //use received coeff.
                    end

                    if(finishRx && gotoRx == phase1)
                         {substateTxnext,substateRxnext}= {phase1,phase1};
                end
                {phase1,phase1}:
                begin
                    //disableScrambler = 1'b0;
                    LF = LocalLF;
                    FS = LocalFS;
                    if(finishRx && gotoRx == phase2)
                         {substateTxnext,substateRxnext}= {recoveryRcvrLock,recoveryRcvrLock};
                end

                {recoveryIdle,recoveryIdle}:
                begin
                    //disableScrambler = 1'b0;
                    if((finishRx && gotoRx == L0) && (finishTx && gotoTx == L0))
                         {substateTxnext,substateRxnext}= {L0,L0};
                end
           endcase

        end 
        default:
            nextState = reset_;
       endcase 
        
    end

always @ (posedge clk)
begin
    if(~reset) 
    begin 
        PCLKRate <= 0; 
    end
    else begin
    if (GEN == 1)begin
        case(GEN1_PIPEWIDTH)
            8:PCLKRate<=2; //250
            16:PCLKRate<=1; //125
            32:PCLKRate<=0; //62.5
        endcase
    end
    else if (GEN == 2)
    begin
        case(GEN2_PIPEWIDTH)
            8:PCLKRate<=3; //500
            16:PCLKRate<=2; //250
            32:PCLKRate<=1; //125
    endcase
    end
    else if (GEN == 3)begin
        case(GEN3_PIPEWIDTH)
            8:PCLKRate<=4; //1000
            16:PCLKRate<=3; //500
            32:PCLKRate<=2; //250
        endcase
    end
    else if (GEN == 4)begin
        case(GEN4_PIPEWIDTH)
            8:PCLKRate<=5; //2000
            16:PCLKRate<=4; //1000
            32:PCLKRate<=3; //500
        endcase
    end
    else if (GEN == 5)begin
        case(GEN5_PIPEWIDTH)
            8:PCLKRate<=6; //4000
            16:PCLKRate<=5; //2000
            32:PCLKRate<=4; //1000
        endcase
    end
    end
end



    assign{numberOfDetectedLanesOut,linkNumberOutTx,linkNumberOutRx,rateIdOut,upConfigureCapabilityOut} = {numberOfDetectedLanes,linkNumber
    ,linkNumber,rateId,upConfigureCapability};
    
endmodule