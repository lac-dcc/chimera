//----------- generate a second clock -------------------
//---------------- author : Dino ------------------------
module timeCounter(
	input CLK,
	input RST, 
	output reg [15: 0] Time
);
    integer counter=0;
    always @ (posedge CLK)
    begin
		if(!RST) begin 
			Time <= 0;
			counter <= 0;
		end
        else if((counter+1)==100000000)
        begin
            counter <= 0;
            Time <= Time+1;
        end
        else
            counter <= counter+1;
    end
endmodule
