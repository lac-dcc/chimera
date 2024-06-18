// This program was cloned from: https://github.com/jrpompio/Circuitos-Digitales-II
// License: MIT License

module gatemanager (
    input wire clk,
    input wire sensorA,
    input wire sensorB,
    input wire authenticated,
    output reg gateState,
    output reg blockAlarm
);

parameter gateClose = 3'b001;
parameter gateOpen = 3'b010;
parameter gateBlock = 3'b100;

reg [2:0] state;
reg [2:0] nextState;

always @(posedge clk) begin
    state <= nextState;
end

always @(*) begin


    if (state == gateOpen)
    begin
      gateState = 1'b1;
    end else begin 
      gateState = 1'b0;
    end

    if ( state == gateBlock)
    begin
      blockAlarm = 1'b1;
    end else begin 
      blockAlarm = 1'b0;
    end

case (state)

    gateOpen: if (sensorB) nextState = gateClose;

    gateBlock: if (authenticated) nextState = gateClose;
    
    gateClose: 
    begin
      if (sensorA && ~sensorB && authenticated) nextState = gateOpen;
      else if (sensorA && sensorB) nextState = gateBlock;
    end
    default: nextState = gateClose; 

endcase

end

    
endmodule