// This program was cloned from: https://github.com/wongmatthew73/tt06-mw-pmic
// License: Apache License 2.0

`default_nettype none

module pwm(
    input clk,
    input reset,
    //input enable,
    input busy,
    input [7:0] adcVoltage,
    output convStart,
    output rd_cs,
    output syncRegOutLs,
    output syncRegOutHs
    );
    
    parameter [7:0] dutyMaxTime = 256;
    parameter [7:0] pwmDeadzone = 5;
    parameter [4:0] conversionTime = 10;
    parameter [36:0] adcHeartBeatTime = 1024;
    
    wire [7:0] pwmLow;
    reg [7:0] pwmHigh;
    wire [7:0] dutyCalcFromADC;
    
    //If countermode is 00, no change.
    //If countermode is 01, duty cycle high count.
    //If countermode is 10, duty cycle low count.
    //If countermode is 11, deadzone count
    reg [1:0] counterMode;
    reg counterFlag;
    reg [8:0] counter;

    reg [2:0] nextSyncState;
    reg [2:0] syncState;
    reg [1:0] syncRectifierReg;
    
    reg [2:0] adcReadState;
    reg convStartTrig;
    reg rd_cs_trig;
    reg [5:0] adcCounter;
    reg [36:0] adcHeartBeatCounter;
    reg [7:0] adcVoltageRegister;
    reg adcStart;
    
    assign syncRegOutLs = syncRectifierReg[0];
    assign syncRegOutHs = syncRectifierReg[1];
    assign convStart = convStartTrig;
    assign rd_cs = rd_cs_trig;
    assign dutyCalcFromADC = adcVoltageRegister;
    assign pwmLow = dutyMaxTime - pwmHigh;
    
    //Heartbeat periodically pings ADC and requests adc conversion.
    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin // || enable == 0) begin
            adcStart <= 0;
            adcHeartBeatCounter <= 0;
        end
        else begin
            if(adcHeartBeatCounter == 0) begin
                adcStart <= 1;
                adcHeartBeatCounter <= adcHeartBeatCounter + 1;
            end
            else if(0 < adcHeartBeatCounter && adcHeartBeatCounter <= adcHeartBeatTime) begin
                adcStart <= 0;
                adcHeartBeatCounter <= adcHeartBeatCounter + 1;
            end
            else if(adcHeartBeatCounter > adcHeartBeatTime) begin
                adcHeartBeatCounter <= 0;
            end
            else begin
            
            end
        end
    end
    
    //State machine for adc conversion process. Refer to ADC datasheet for more details. I believe I'm using mode 2.
    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin // || enable == 0) begin
            convStartTrig <= 0;
            rd_cs_trig <= 1;
            adcVoltageRegister <= 0;
            adcCounter <= 0;
            adcReadState <= 0;
        end
        else begin
            case(adcReadState)
                //Default state. Do nothing here.
                3'b000 : begin
                    if(adcStart) begin
                        adcReadState <= 3'b001;
                    end
                end
                //Set conversion to high to start ADC conversion process
                3'b001 : begin
                    convStartTrig <= 1;
                    adcReadState <= 3'b010;
                end
                //Set conversion to low again.
                3'b010 : begin
                    if(adcCounter >= conversionTime) begin
                        adcCounter <= 0;
                        convStartTrig <= 0;
                        adcReadState <= 3'b011;
                    end
                    else begin
                        adcCounter <= adcCounter + 1;
                    end
                end
                //Wait for busy flag to go high.
                3'b011 : begin
                    if(busy == 1) begin
                        adcReadState <= 3'b100;
                    end
                end
                //Wait for busy flag to go low.
                3'b100 : begin
                    if(busy == 0) begin
                        adcReadState <= 3'b101;
                    end
                end
                //Set read and chip select to low to start ADC read. Tying both together should be fine.
                3'b101 : begin
                    rd_cs_trig <= 0;
                    adcReadState <= 3'b110;
                end
                //Set read and chip select to high.
                3'b110 : begin
                    if(adcCounter >= conversionTime) begin
                        adcVoltageRegister <= adcVoltage;
                        rd_cs_trig <= 1;
                        adcReadState <= 3'b000;
                        adcCounter <= 0;
                    end
                    else begin
                        adcCounter <= adcCounter + 1;
                    end
                    
                end
                3'b111 : begin
                    //Do nothing
                end
            endcase
        end
    end
    
    //Keep the pwm high and low duty cycles within 256 cycles. Otherwise they would cross the deadzone limit and maybe cause shoot-thru to occur
    //potentially damaging FETs.
    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin // || enable == 0) begin
            //Set default pwm high to non-zero so that there is a minimum voltage on the output.
            pwmHigh <= 3; 
        end
        else begin
            if(dutyCalcFromADC > 2) begin
                if((pwmHigh) <= dutyCalcFromADC) begin
//                if(pwmHigh <= dutyCalcFromADC) begin
                    if(pwmHigh < 255) begin
                        pwmHigh <= pwmHigh + 1;
                    end
    
                end
                else if((pwmHigh) > dutyCalcFromADC) begin
                    if(pwmHigh > 0) begin
                        pwmHigh <= pwmHigh - 1;
                    end
                end
                else begin
                    pwmHigh <= 3;
                end
            end
            else begin
                pwmHigh <= 3;
            end
        end
    end
      
    //Counter for duty cycle and deadzone.
    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin // || enable == 0) begin
            counterFlag <= 0;
            counter <= 0;
            syncState <= 0;
        end
        else begin
            if(counterFlag == 0) begin
                if(counterMode == 2'b00) begin
                    counterFlag <= 1;
                    syncState <= nextSyncState;
                end
                else if(counterMode == 2'b01) begin
                    if(counter >= pwmHigh) begin
                        counterFlag <= 1;
                        counter <= 0;
                        syncState <= nextSyncState;
                    end
                    else begin
                        counter <= counter + 1;
                    end
                end
                else if(counterMode == 2'b10) begin
                    if(counter >= pwmLow) begin
                        counterFlag <= 1;
                        counter <= 0;
                        syncState <= nextSyncState;
                    end
                    else begin
                        counter <= counter + 1;
                    end
                end
                else if(counterMode == 2'b11) begin
                    if(counter >= pwmDeadzone) begin
                        counterFlag <= 1;
                        counter <= 0;
                        syncState <= nextSyncState;
                    end
                    else begin
                        counter <= counter + 1;
                    end
                end
            end
            else begin
                counterFlag <= 0;
            end
        end
    end
    
    //Synchronous Rectifier state machine. Doesn't matter which signal you use for the high side and low-side FETs. 
    //But the high-side FET input should be handled externally with a high-side driver. I'm using MCP14700
    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin // || enable == 0) begin
            syncRectifierReg[0] <= 0;
            syncRectifierReg[1] <= 0;
            nextSyncState <= 3'b000;
            counterMode <= 2'b00;
        end
        else begin
            case(syncState)
                //This is essentially the reset state. Set both synchronous rectifier FET gate voltages to low so 
                //they're both off so that there's no shoot thru. 
                3'b000 : begin
                    syncRectifierReg[0] <= 0;
                    syncRectifierReg[1] <= 0;
                    nextSyncState <= 3'b001;
                    counterMode <= 2'b10;
                end
                3'b001 : begin
                    //Startup FET1 duty high
                    syncRectifierReg[0] <= 1;
                    syncRectifierReg[1] <= 0;
                    nextSyncState <= 3'b010;
                    counterMode <= 2'b01;
                end
                3'b010 : begin
                    //FET1 duty low
                    syncRectifierReg[0] <= 0;
                    syncRectifierReg[1] <= 0;
                    nextSyncState <= 3'b011;
                    counterMode <= 2'b10;
                end
                3'b011 : begin
                    //FET1 deadzone
                    syncRectifierReg[0] <= 0;
                    syncRectifierReg[1] <= 0;
//                    nextSyncState <= 3'b100;
                    nextSyncState <= 3'b101;
                    counterMode <= 2'b11;
                end
                3'b100 : begin
                    //FET2 duty low
                    syncRectifierReg[0] <= 0;
                    syncRectifierReg[1] <= 0;
                    nextSyncState <= 3'b101;
                    counterMode <= 2'b10;
                end
                3'b101 : begin
                    //FET2 duty high
                    syncRectifierReg[0] <= 0;
                    syncRectifierReg[1] <= 1;
                    nextSyncState <= 3'b110;
                    counterMode <= 2'b01;
                end
                3'b110 : begin
                    //FET2 duty low
                    syncRectifierReg[0] <= 0;
                    syncRectifierReg[1] <= 0;
                    nextSyncState <= 3'b111;
                    counterMode <= 2'b10;
                end
                3'b111 : begin
                    //FET2 deadzone
                    syncRectifierReg[0] <= 0;
                    syncRectifierReg[1] <= 0;
                    nextSyncState <= 3'b001;
                    counterMode <= 2'b11;
                end
            endcase
        end
    end

endmodule
