module osChecker #(parameter DEVICETYPE = 0,parameter GEN1_PIPEWIDTH = 8,
 parameter GEN2_PIPEWIDTH = 8, parameter GEN3_PIPEWIDTH = 8, parameter GEN4_PIPEWIDTH = 8,parameter GEN5_PIPEWIDTH = 8)
 (
    input clk,
    input [7:0]linkNumber,
    input [7:0]laneNumber,
    input [127:0]orderedset,
    input valid,
    input [4:0]substate,
    input reset,
    input directed_speed_change,
    input [2:0]gen,
    output reg countup,
    output reg resetcounter,
    output [7:0] rateid,
    output [7:0] linkNumberOut,
    output upconfigure_capability,
    output reg RcvrCfgToidle,
    output reg[5:0]LFDSP,
    output reg[5:0]FSDSP,
    output reg [2:0] ReceiverpresetHintDSPout,
    output reg [3:0] TransmitterPresetHintDSPout,
    output reg [2:0] ReceiverpresetHintUSPout,
    output reg [3:0] TransmitterPresetHintUSPout,
    output reg detailedRecoverySubstates,
    input [2:0] ReceiverpresetHintDSP,
    input [3:0] TransmitterPresetHintDSP,
    input [2:0] ReceiverpresetHintUSP,
    input [3:0] TransmitterPresetHintUSP,
    input [5:0]CursorCoff,
    input [5:0]PreCursorCoff,
    input [5:0]PostCursorCoff);

    //LOCLA VARIABLES
    reg[5:0] currentState,nextState;
    reg[127:0] localorderedset;
    reg notEqual;
    reg [7:0]linkNumberReg;
    wire ts1CorrectStart,ts2CorrectStart;
    localparam [7:0]
    PAD = 8'hF7, 
    TS1 = 8'h4A,
    TS2 = 8'h45,
    COM = 	8'hBC, //BC
    gen3TS1 = 8'h1E,
    gen3TS2 = 8'h2D,
    gen3eios = 8'h66,
    idle = 8'h7c,
    gen1eieos = 8'hC4;

//input substates from main ltssm

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

//internal states
    localparam [5:0]
        start = 6'd0,
        pollingActive1= 6'd1,
        pollingActive2= 6'd2,
        pollingConfiguration1= 6'd3,
        pollingConfiguration2= 6'd4,
        configLinkWidthStartDown1 = 6'd5,
        configLinkWidthStartDown2 = 6'd6,
        configLinkWidthStartUp1 = 6'd7,
        configLinkWidthStartUp2 = 6'd8,
        configLinkWidthAcceptUp1 = 6'd9,
        configLinkWidthAcceptUp2 = 6'd10,
        configLanenumWaitDown1 = 6'd11,
        configLanenumWaitDown2 = 6'd12,
        configLanenumWaitUp1 = 6'd13,
        configLanenumWaitUp2 = 6'd14,
        configLanenumAcceptDown1 = 6'd15,
        configLanenumAcceptDown2 = 6'd16,
        configLanenumAcceptUp1 = 6'd17,
        configLanenumAcceptUp2 = 6'd18,
        configCompleteDown1 = 6'd19,
        configCompleteDown2 = 6'd20,
        configCompleteUp1 = 6'd21,
        configCompleteUp2 = 6'd22,
        configIdle1 = 6'd23,
        configIdle2 = 6'd24,
        /*****recovery lock****/
        RcvrLock1    = 6'd25,
        RcvrLock2 = 6'd26,
        /*****recovery configuration****/
        RcvrCfg = 6'd27,
        RcvrCfg_speed = 6'd28,
        RcvrCfg_idle = 6'd29,
        /*********eq***********************/
        phase0up1 = 6'd30,
        phase0up2 = 6'd31,
        phase0down1 = 6'd32,
        phase0down2 = 6'd33,

        phase1up1 = 6'd34,
        phase1up2 = 6'd35,
        phase1down1 = 6'd36,
        phase1down2 = 6'd37,
        /***********speed******************/
        RcvrSpeed1 = 6'd38,
        RcvrSpeed2 = 6'd39,
        RcvrIdle1 = 6'd40,
        RcvrIdle2 = 6'd41,
        L0up1 = 6'd42,
        L0up2 = 6'd43,
        RcvrSpeedeieos1 = 6'd45,
        RcvrSpeedeieos2 = 6'd46;


reg [7:0]symbol6OfTS2;
reg [7:0]rateidTs2;




//CURRENT STATE FF
always @(posedge clk or negedge reset)
begin
    notEqual <= 1'b0;
    if(!reset)
    begin
        currentState <= start;
    end
    else
    begin
        currentState <= nextState;
        if(valid)
        begin
            localorderedset<=orderedset;
            if((currentState == configCompleteDown2||currentState == configCompleteUp2)&&(localorderedset[42] != orderedset[42] || localorderedset[39:32] != orderedset[39:32]))
            notEqual <= 1'b1;
        end
    end    
end

//next state logic block
always @(*)
begin
    case(currentState)
        start:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if      (substate == pollingActive) nextState = pollingActive1;
            else if (substate == pollingConfiguration) nextState = pollingConfiguration1;
            else if (substate == configurationLinkWidthStart && DEVICETYPE == 1'b0)nextState = configLinkWidthStartDown1;
            else if (substate == configurationLinkWidthStart && DEVICETYPE == 1'b1)nextState = configLinkWidthStartUp1;
            else if (substate == configurationLinkWidthAccept && DEVICETYPE == 1'b1)nextState = configLinkWidthAcceptUp1;
            else if (substate == configurationLanenumWait && DEVICETYPE == 1'b0) nextState = configLanenumWaitDown1;
            else if (substate == configurationLanenumWait && DEVICETYPE == 1'b1) nextState = configLanenumWaitUp1;
            else if (substate == configurationLanenumAccept && DEVICETYPE == 1'b0) nextState = configLanenumAcceptDown1;
            else if (substate == configurationLanenumAccept && DEVICETYPE == 1'b1) nextState = configLanenumAcceptUp1;
            else if (substate == configurationComplete && DEVICETYPE == 1'b0) nextState = configCompleteDown1;
            else if (substate == configurationComplete && DEVICETYPE == 1'b1) nextState = configCompleteUp1;
            else if (substate == configurationIdle) nextState = configIdle1;
            else if (substate == recoveryRcvrLock) nextState = RcvrLock1;
            else if (substate == recoveryRcvrCfg) nextState = RcvrCfg;
            else if (substate == recoverySpeed) nextState = RcvrSpeed1;
            else if (substate == phase0 && DEVICETYPE) nextState = phase0up1;
            else if (substate == phase0 && !DEVICETYPE)nextState = phase0down1;
            else if (substate == phase1 && DEVICETYPE) nextState = phase1up1;
            else if (substate == phase1 && !DEVICETYPE)nextState = phase1down1;
            else if (substate == recoveryIdle)nextState = RcvrIdle1;
            else if (substate == recoverySpeedeieos)nextState = RcvrSpeedeieos1;

            else nextState = start;
        end
/******************************polling Active**************************************************/
        pollingActive1:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if((valid&&ts1CorrectStart&&orderedset[15:8]==PAD && orderedset[23:16]==PAD && orderedset[43] == 1'b0 && orderedset[87:80] == TS1)||
            (valid&&ts2CorrectStart&&orderedset[15:8]==PAD && orderedset[23:16]==PAD && orderedset[87:80] == TS2)||
            (valid&&ts1CorrectStart&&orderedset[15:8]==PAD && orderedset[23:16]==PAD && orderedset[42] == 1'b1 && orderedset[87:80] == TS1)) 
            begin
            nextState = pollingActive2;
            resetcounter = 1'b1; countup = 1'b1;
            end
            else nextState = pollingActive1;
        end
        pollingActive2:
        begin
            resetcounter = 1'b1; countup = 1'b0; 
            if(valid)
            begin
            if((ts1CorrectStart&&orderedset[15:8]==PAD && orderedset[23:16]==PAD && orderedset[43] == 1'b0 && orderedset[87:80] == TS1)||
                (ts2CorrectStart&&orderedset[15:8]==PAD && orderedset[23:16]==PAD && orderedset[87:80] == TS2)||
                (ts1CorrectStart&&orderedset[15:8]==PAD && orderedset[23:16]==PAD && orderedset[42] == 1'b1 && orderedset[87:80] == TS1)) 
                begin
                    countup = 1'b1; 
                    nextState = pollingActive2;
                end
            else nextState = pollingActive1; 
            end
            else nextState = pollingActive2;
            
        end
        /**********************************pollingConfiguration*****************************************************/
        pollingConfiguration1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&ts2CorrectStart&& orderedset[15:8]==PAD && orderedset[23:16]==PAD && orderedset[87:80] == TS2)
            begin
                nextState = pollingConfiguration2;
                resetcounter = 1'b1; countup = 1'b1;
            end
            else nextState = pollingConfiguration1;
        end

        pollingConfiguration2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
            begin
                if(ts2CorrectStart&&orderedset[15:8]==PAD && orderedset[23:16]==PAD && orderedset[87:80] == TS2)
                begin
                    countup = 1'b1; 
                    nextState = pollingConfiguration2;
                end
                else nextState = pollingConfiguration1;        
            end
            else nextState = pollingConfiguration2;
        end
        /**********************************configLinkWidthStart*************************************************/
        configLinkWidthStartDown1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid&&ts1CorrectStart&&orderedset[15:8]==linkNumber && orderedset[23:16]==PAD && orderedset[87:80] == TS1)
            begin
                nextState =  configLinkWidthStartDown2;
                resetcounter = 1'b1; countup = 1'b1;
            end
            else nextState = configLinkWidthStartDown1;
        end

        configLinkWidthStartDown2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if(ts1CorrectStart&&orderedset[15:8]==linkNumber && orderedset[23:16]==PAD && orderedset[87:80] == TS1)
                    begin
                        countup = 1'b1;
                        nextState =  configLinkWidthStartDown2;
                    end
                    else nextState =  configLinkWidthStartDown1;
                end
            else nextState =  configLinkWidthStartDown2;
        end
        configLinkWidthStartUp1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&ts1CorrectStart&&orderedset[15:8]!=PAD && orderedset[23:16]==PAD && orderedset[87:80] == TS1)
            begin
                nextState =  configLinkWidthStartUp2;
                linkNumberReg = orderedset[15:8];
                resetcounter = 1'b1; countup = 1'b1;
            end
                else nextState = configLinkWidthStartUp1;
        end

        configLinkWidthStartUp2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if(ts1CorrectStart&&orderedset[15:8]==linkNumberReg && orderedset[23:16]==PAD && orderedset[87:80] == TS1)
                    begin
                        countup =1'b1;
                        nextState =  configLinkWidthStartUp2;
                    end
                    else nextState =  configLinkWidthStartUp1;
                end
            else nextState =  configLinkWidthStartUp2;
        end
        /********************************configLinkWidthAccept**************************************************/
            configLinkWidthAcceptUp1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]!=PAD  && orderedset[87:80] == TS1)
            begin
                nextState = configLinkWidthAcceptUp2;
                resetcounter = 1'b1; countup = 1'b1;
            end
                else nextState = configLinkWidthAcceptUp1;
        end

        configLinkWidthAcceptUp2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if(ts1CorrectStart&&orderedset[15:8]==linkNumber && orderedset[23:16]!=PAD && orderedset[87:80] == TS1)
                    begin
                        countup = 1'b1;
                        nextState =  configLinkWidthAcceptUp2;
                    end
                    else nextState =  configLinkWidthAcceptUp1;
                end
            else nextState =  configLinkWidthAcceptUp2;
        end
        /******************************configLanenumWait***************************************************/
            configLanenumWaitDown1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid && ts1CorrectStart&&orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber && orderedset[87:80] == TS1)
            begin
                nextState = configLanenumWaitDown2;
                resetcounter = 1'b1; countup = 1'b1;
            end
            else nextState = configLanenumWaitDown1;
        end

        configLanenumWaitDown2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
            begin
                if(ts1CorrectStart&&orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber && orderedset[87:80] == TS1)
                begin
                    countup = 1'b1;
                    nextState =  configLanenumWaitDown2;
                end
                else nextState =  configLanenumWaitDown1;
            end
            else nextState =  configLanenumWaitDown2;
        end

        configLanenumWaitUp1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid && ts2CorrectStart&&orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber && orderedset[87:80] == TS2)
            begin
            nextState = configLanenumWaitUp2;
            resetcounter = 1'b1; countup = 1'b1;
            end
            else nextState = configLanenumWaitUp1;
        end

        configLanenumWaitUp2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if(ts2CorrectStart&&orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber && orderedset[87:80] == TS2)
                    begin
                        countup = 1'b1;
                        nextState =  configLanenumWaitUp2;
                    end
                    else nextState =  configLanenumWaitUp1;
                end
            else nextState =  configLanenumWaitUp2;
        end
        /*********************************configLanenumAccept************************************************/
        configLanenumAcceptDown1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid && ts1CorrectStart&&orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber && orderedset[87:80] == TS1)
            begin
                nextState = configLanenumAcceptDown2;
                resetcounter = 1'b1; countup = 1'b1;
            end
            else nextState = configLanenumAcceptDown1;
        end

        configLanenumAcceptDown2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
            begin
                if(ts1CorrectStart&&orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber && orderedset[87:80] == TS1)
                begin
                    countup = 1'b1;
                    nextState =  configLanenumAcceptDown2;
                end
                else nextState =  configLanenumAcceptDown1;
            end
            else nextState =  configLanenumAcceptDown2;
        end

        configLanenumAcceptUp1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&ts2CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber && orderedset[87:80] == TS2)
            begin 
                nextState = configLanenumAcceptUp2;
                resetcounter = 1'b1; countup = 1'b1;
            end
            else nextState = configLanenumAcceptUp1;
        end

        configLanenumAcceptUp2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
            begin
                if(ts2CorrectStart&&orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber && orderedset[87:80] == TS2)
                begin
                    countup = 1'b1;
                    nextState =  configLanenumAcceptUp2;
                end
                else nextState =  configLanenumAcceptUp1;
            end
            else nextState =  configLanenumAcceptUp2;
        end
        /****************************************configComplete***************************************************/
        configCompleteDown1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&ts2CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber && orderedset[87:80] == TS2)
            begin
            nextState = configCompleteDown2;
            resetcounter = 1'b1; countup = 1'b1;
            end
            else nextState = configCompleteDown1;
        end

        configCompleteDown2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(notEqual)nextState = configCompleteDown1;
            else if(valid)
            begin
                if(ts2CorrectStart&&orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber && orderedset[87:80] == TS2)
                begin
                    countup = 1'b1;
                    nextState =  configCompleteDown2;
                end
                else nextState =  configCompleteDown1;
            end
            else nextState =  configCompleteDown2;
        end

        configCompleteUp1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&ts2CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber && orderedset[87:80] == TS2)
            begin
            nextState = configCompleteUp2;
            resetcounter = 1'b1; countup = 1'b1;
            end
            else nextState = configCompleteUp1;
        end
        configCompleteUp2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(notEqual)nextState = configCompleteUp1;
            else if(valid)
                begin
                    if(ts2CorrectStart&&orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber && orderedset[87:80] == TS2)
                    begin
                        countup = 1'b1;
                        nextState =  configCompleteUp2;
                    end
                    else nextState =  configCompleteUp1;
                end
            else nextState =  configCompleteUp2;
        end
        /***************************************configIdle***********************************************/
        configIdle1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&( (gen == 3'd1 && |orderedset[GEN1_PIPEWIDTH-1:0]==1'b0) ||(gen == 3'd2 && |orderedset[GEN2_PIPEWIDTH-1:0]==1'b0)
            ||(gen == 3'd3 && |orderedset[GEN3_PIPEWIDTH-1:0]==1'b0) ||(gen == 3'd4 && |orderedset[GEN4_PIPEWIDTH-1:0]==1'b0)
            ||(gen == 3'd5 && |orderedset[GEN1_PIPEWIDTH-5:0]==1'b0)  ))
            begin
            nextState = configIdle2;
            resetcounter = 1'b1; countup = 1'b1;
            end
            else nextState = configIdle1;
        end

        configIdle2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if( (gen == 3'd1 && |orderedset[GEN1_PIPEWIDTH-1:0]==1'b0) ||(gen == 3'd2 && |orderedset[GEN2_PIPEWIDTH-1:0]==1'b0)
                    ||(gen == 3'd3 && |orderedset[GEN3_PIPEWIDTH-1:0]==1'b0) ||(gen == 3'd4 && |orderedset[GEN4_PIPEWIDTH-1:0]==1'b0)
                    ||(gen == 3'd5 && |orderedset[GEN1_PIPEWIDTH-5:0]==1'b0)  )
                    begin
                        countup = 1'b1;
                        nextState =  configIdle2;
                    end
                    else nextState =  configIdle1;
                end
            else nextState =  configIdle2;   
        end
/***************************************************RECOVERY********************************************************/
        RcvrLock1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&(ts2CorrectStart||ts1CorrectStart)&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
            &&(orderedset[87:80] == TS2||orderedset[87:80] == TS1)&&orderedset[39]==directed_speed_change&&
            ((orderedset[49:48] == 2'b00&&gen >= 3'd3)||(orderedset[55:48] == TS1 ||orderedset[55:48] == TS2)))
            begin
            nextState = RcvrLock2;
            resetcounter = 1'b1; countup = 1'b1;
            end

            else nextState = RcvrLock1;
        end


        RcvrLock2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if((ts2CorrectStart||ts1CorrectStart)&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
                    &&(orderedset[87:80] == TS2||orderedset[87:80] == TS1)&&orderedset[39]==directed_speed_change&&
                    ((orderedset[49:48] == 2'b00&&gen >= 3'd3)||(orderedset[55:48] == TS1 ||orderedset[55:48] == TS2)))
                    begin
                        countup = 1'b1;
                        nextState =  RcvrLock2;
                    end
                    else nextState =  RcvrLock1;
                end
            else nextState =  RcvrLock2;
        end

        L0up1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&DEVICETYPE&&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
            &&orderedset[87:80] == TS1&&orderedset[39]==1'b1)
            begin
            nextState = L0up2;
            resetcounter = 1'b1; countup = 1'b1;
            end

            else nextState = L0up1;

        end
        L0up2:
        begin
             resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                   if(valid &&DEVICETYPE&&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
                    &&orderedset[87:80] == TS1&&orderedset[39]==1'b1)
                    begin
                        countup = 1'b1;
                        nextState =  L0up2;
                    end
                    else nextState =  L0up1;
                end
            else nextState =  L0up2;

        end

        phase0up1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&DEVICETYPE&&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
            &&orderedset[87:80] == TS1&&orderedset[39]==1'b0&&orderedset[49:48] != 2'b00)
            begin
            nextState = phase0up2;
            resetcounter = 1'b1; countup = 1'b1;
            FSDSP = orderedset[61:56];
            LFDSP = orderedset[69:64];
            end

            else nextState = phase0up1;

        end

        phase0up2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if(DEVICETYPE&&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
                    &&orderedset[87:80] == TS1&&orderedset[39]==1'b0&&orderedset[49:48] != 2'b00)
                    begin
                        countup = 1'b1;
                        nextState =  phase0up2;
                        FSDSP = orderedset[61:56];
                        LFDSP = orderedset[69:64];
                    end
                    else nextState =  phase0up1;
                end
            else nextState =  phase0up2;
        end
      
        phase0down1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&!DEVICETYPE&&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
            &&orderedset[87:80]==TS1&&orderedset[54:51]==TransmitterPresetHintDSP
            &&orderedset[7*8+5:7*8]==PreCursorCoff&&orderedset[8*8+5:8*8]==CursorCoff&&orderedset[9*8+5:9*8]==PostCursorCoff&&orderedset[49:48]== 2'b00)
            begin
            nextState = phase0down2;
            resetcounter = 1'b1; countup = 1'b1;
            end

            else nextState = phase0down1;

        end

        phase0down2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if(!DEVICETYPE&&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
                    &&orderedset[87:80] == TS1&&orderedset[54:51]==TransmitterPresetHintDSP
                    &&orderedset[7*8+5:7*8]==PreCursorCoff&&orderedset[8*8+5:8*8]==CursorCoff&&orderedset[9*8+5:9*8]==PostCursorCoff&&orderedset[49:48]== 2'b00)
                    begin
                        countup = 1'b1;
                        nextState =  phase0down2;
                    end
                    else nextState =  phase0down1;
                end
            else nextState =  phase0down2;
        end

        phase1up1:
        begin
            detailedRecoverySubstates = 1'b0;
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&DEVICETYPE&&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
            &&orderedset[87:80] == TS1&&orderedset[49:48] == 2'b10)
            begin
            nextState = phase1up2;
            resetcounter = 1'b1; countup = 1'b1;
            end

            else if(valid &&DEVICETYPE&&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
            &&orderedset[87:80] == TS1&&orderedset[49:48] == 2'b00)
            begin
            nextState = phase1up2;
            resetcounter = 1'b1; countup = 1'b1;
            detailedRecoverySubstates = 1'b1;
            end

            else nextState = phase1up1;

        end

        phase1up2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if(DEVICETYPE&&!detailedRecoverySubstates&&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
                    &&orderedset[87:80] == TS1&&orderedset[49:48] == 2'b10)
                    begin
                        countup = 1'b1;
                        nextState =  phase1up2;
                    end

                    else if(DEVICETYPE&&detailedRecoverySubstates&&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
                    &&orderedset[87:80] == TS1&&orderedset[49:48] == 2'b00)
                    begin
                        countup = 1'b1;
                        nextState =  phase1up2;
                    end

                    else nextState =  phase1up1;
                end
            else nextState =  phase1up2;
        end

        phase1down1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&!DEVICETYPE&&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
            &&orderedset[87:80]==TS1&&orderedset[49:48]== 2'b01)
            begin
            nextState = phase1down2;
            resetcounter = 1'b1; countup = 1'b1;
            end

            else nextState = phase1down1;

        end

        phase1down2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if(!DEVICETYPE&&ts1CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
                    &&orderedset[87:80] == TS1&&orderedset[49:48]== 2'b01)
                    begin
                        countup = 1'b1;
                        nextState =  phase1down2;
                    end
                    else nextState =  phase1down1;
                end
            else nextState =  phase1down2;
        end


        RcvrCfg:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&ts2CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
            &&orderedset[87:80] == TS2&&orderedset[39]==1'b1 &&orderedset[55]==1'b1)
            begin
                nextState = RcvrCfg_speed;
                rateidTs2 = orderedset[39:32];
                symbol6OfTS2 = orderedset[55:48];
                resetcounter = 1'b1; countup = 1'b1;
                if(DEVICETYPE)
                begin
                    ReceiverpresetHintDSPout = localorderedset[50:48];
                    TransmitterPresetHintDSPout = localorderedset[54:51];
                end
                else if(!DEVICETYPE)
                begin
                    ReceiverpresetHintUSPout = localorderedset[50:48];
                    TransmitterPresetHintUSPout = localorderedset[54:51];
                end
            end
            else if(valid &&ts2CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
            &&orderedset[87:80] == TS2&&orderedset[39]==1'b0)
            begin
                nextState = RcvrCfg_idle;
                resetcounter = 1'b1; countup = 1'b1;
            end

            else nextState = RcvrCfg;
        end

        RcvrCfg_speed:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if(ts2CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
                    &&orderedset[87:80] == TS2&&orderedset[39]==1'b1 &&orderedset[39:32]==rateidTs2
                    &&orderedset[55:48]==symbol6OfTS2&&orderedset[55]==1'b1)
                    begin
                        symbol6OfTS2 = orderedset[55:48];
                        rateidTs2 = orderedset[39:32];
                        resetcounter = 1'b1; countup = 1'b1;
                        countup = 1'b1;
                        nextState =  RcvrCfg_speed;
                        RcvrCfgToidle = 1'b0;
                        if(DEVICETYPE)
                            begin
                                ReceiverpresetHintDSPout = localorderedset[50:48];
                                TransmitterPresetHintDSPout = localorderedset[54:51];
                            end
                        else if(!DEVICETYPE)
                            begin
                                ReceiverpresetHintUSPout = localorderedset[50:48];
                                TransmitterPresetHintUSPout = localorderedset[54:51];
                            end
                    end
                    else nextState =  RcvrCfg;
                end
            else nextState =  RcvrCfg_speed;
        end

        RcvrCfg_idle:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if(ts2CorrectStart&& orderedset[15:8]==linkNumber && orderedset[23:16]==laneNumber 
                    &&orderedset[87:80] == TS2&& orderedset[39]==1'b0)
                    begin
                        resetcounter = 1'b1; countup = 1'b1;
                        countup = 1'b1;
                        nextState =  RcvrCfg_idle;
                        RcvrCfgToidle = 1'b1;
                    end
                    else nextState =  RcvrCfg;
                end
            else nextState =  RcvrCfg_idle;
        end

        RcvrSpeed1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&((gen==3'd3&&(|orderedset == 8'h66))||(gen!=3'd3&&orderedset[7:0]==COM &&(orderedset[31:8]=={3{idle}}))))
            begin
            nextState = RcvrSpeed2;
            resetcounter = 1'b1; countup = 1'b1;
            RcvrCfgToidle = 1'b0;
            end
            else nextState = RcvrSpeed1;
        end

        RcvrSpeed2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if(((gen==3'd3&&(|orderedset == 8'h66))||(gen!=3'd3&&orderedset[7:0]==COM &&(|orderedset[31:8]=={3{idle}}))))
                    begin
                        countup = 1'b1;
                        nextState =  RcvrSpeed2;
                        RcvrCfgToidle = 1'b0;
                    end
                    else nextState =  RcvrSpeed1;
                end
            else nextState =  RcvrSpeed2;
        end

        RcvrSpeedeieos1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&((gen==3'd4 && orderedset=={4{32'hFFFF0000}})||(gen==3'd5&&orderedset=={2{64'hFFFFFFFF00000000}})||
            (gen==3'd3&&orderedset=={8{16'hFF00}})||(gen<3'd3&&orderedset[7:0]==COM &&(orderedset[119:8]=={14{gen1eieos}}))))
            begin
            nextState = RcvrSpeedeieos2;
            resetcounter = 1'b1; countup = 1'b1;
            RcvrCfgToidle = 1'b0;
            end
            else nextState = RcvrSpeedeieos1;
        end

        RcvrSpeedeieos2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                    if((gen==3'd4 && orderedset=={4{32'hFFFF0000}})||(gen==3'd5&&orderedset=={2{64'hFFFFFFFF00000000}})||
                    (gen==3'd3&&orderedset=={8{16'hFF00}})||
                    (gen<3'd3&&orderedset[7:0]==COM &&(orderedset[119:8]=={14{gen1eieos}})))
                    begin
                        countup = 1'b1;
                        nextState =  RcvrSpeedeieos2;
                        RcvrCfgToidle = 1'b0;
                    end
                    else nextState =  RcvrSpeedeieos1;
                end
            else nextState =  RcvrSpeedeieos2;
        end

        RcvrIdle1:
        begin
            resetcounter = 1'b0; countup = 1'b0;
            if(valid &&( (gen == 3'd1 && |orderedset[GEN1_PIPEWIDTH-1:0]==1'b0) ||(gen == 3'd2 && |orderedset[GEN2_PIPEWIDTH-1:0]==1'b0)
            ||(gen == 3'd3 && |orderedset[GEN3_PIPEWIDTH-1:0]==1'b0) ||(gen == 3'd4 && |orderedset[GEN4_PIPEWIDTH-1:0]==1'b0)
            ||(gen == 3'd5 && |orderedset[GEN1_PIPEWIDTH-5:0]==1'b0)  ))
            begin
            nextState = RcvrIdle2;
            resetcounter = 1'b1; countup = 1'b1;
            RcvrCfgToidle = 1'b0;
            end
            else nextState = RcvrIdle1;
        end

        RcvrIdle2:
        begin
            resetcounter = 1'b1; countup = 1'b0;
            if(valid)
                begin
                     if( (gen == 3'd1 && |orderedset[GEN1_PIPEWIDTH-1:0]==1'b0) ||(gen == 3'd2 && |orderedset[GEN2_PIPEWIDTH-1:0]==1'b0)
                    ||(gen == 3'd3 && |orderedset[GEN3_PIPEWIDTH-1:0]==1'b0) ||(gen == 3'd4 && |orderedset[GEN4_PIPEWIDTH-1:0]==1'b0)
                    ||(gen == 3'd5 && |orderedset[GEN1_PIPEWIDTH-5:0]==1'b0)  )
                    begin
                        countup = 1'b1;
                        nextState =  RcvrIdle2;
                        RcvrCfgToidle = 1'b0;
                    end
                    else nextState =  RcvrIdle1;
                end
            else nextState =  RcvrIdle2;   
        end
        default:nextState = start;
endcase
end
    assign rateid = localorderedset[39:32];
    assign linkNumberOut = localorderedset[15:8];
    assign upconfigure_capability = localorderedset[42];
    assign ts1CorrectStart = (orderedset[7:0]==COM || orderedset[7:0]==gen3TS1)? 1'b1 : 1'b0;
    assign ts2CorrectStart = (orderedset[7:0]==COM || orderedset[7:0]==gen3TS2)? 1'b1 : 1'b0;
    

    
endmodule
