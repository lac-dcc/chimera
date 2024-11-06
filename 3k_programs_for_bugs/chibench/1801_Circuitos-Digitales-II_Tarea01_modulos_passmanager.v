// This program was cloned from: https://github.com/jrpompio/Circuitos-Digitales-II
// License: MIT License

module passmanager (
    input wire clk,
    input wire sensorA,
    input wire gateState,
    input wire [7:0] pass,
    output reg wrongPinAlarm,
    output reg authenticated
);

parameter standby =    6'b000001;
parameter carArrived = 6'b000010;
parameter secondTry =  6'b000100;
parameter thirdTry =   6'b001000;
parameter wrongPin =   6'b010000;
parameter rightPin =   6'b100000;

parameter mypass = 8'b00100110;   // B97026: 26 ---> 0010 0110
                                // 0x26 = 8'b00100110

reg [5:0] state;
reg [5:0] nextState;

always @(posedge clk) begin
    state <= nextState;
end


always @(*) begin
    
    if (state == rightPin) begin
      authenticated = 1'b1;
    end else begin 
      authenticated = 1'b0;
    end

    if (state == wrongPin) begin
       wrongPinAlarm = 1'b1;
    end else begin 
      wrongPinAlarm = 1'b0;
    end


case (state)
    standby: if (sensorA && ~gateState) nextState = carArrived;

    carArrived: begin
        if (mypass == pass) nextState = rightPin;
        else if (pass != mypass) nextState = secondTry;
    end
    
    secondTry: begin
        if (mypass == pass) nextState = rightPin;
        else if (pass != mypass) nextState = thirdTry;
    end

    thirdTry: begin
        if (mypass == pass) nextState = rightPin;
        else if (pass != mypass) nextState = wrongPin;
    end
    wrongPin: if (mypass == pass) nextState = standby;
    
    rightPin: if (~sensorA && ~gateState) nextState = standby; 

    default: nextState = standby;
endcase

end

endmodule
