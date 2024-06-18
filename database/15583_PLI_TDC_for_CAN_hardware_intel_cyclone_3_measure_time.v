// This program was cloned from: https://github.com/shuji-oh/PLI_TDC_for_CAN
// License: MIT License

module measure_time (
	output [26:0] out_data,
	input CLK,
    input SW,
    input CAN_logic,
    output reg [6:0] HEX5,
    output reg [6:0] HEX4,
    output reg [6:0] HEX3,
    output reg [6:0] HEX2,
    output reg [6:0] HEX1,
    output reg [6:0] HEX0,
    output debug1,
    output debug2,
    output write_request
);


// CAN clock generate begin
parameter CAN_ACC_MAX = 50000000 / (500000 * 8);
//parameter CAN_ACC_WIDTH = $clog2(CAN_ACC_MAX);
parameter CAN_ACC_WIDTH = 8;
reg [CAN_ACC_WIDTH - 1:0] can_acc = 0;
wire CAN_clk = (can_acc == 10'd0);

always @(posedge CLK) begin
	if (can_acc == CAN_ACC_MAX[CAN_ACC_WIDTH - 1:0])
		can_acc <= 0;
	else
		can_acc <= can_acc + 10'b1;
end
// CAN clock generate end


// output tempolary CAN ID start
reg [2:0] SWr = 0;
reg [10:0] CAN_ID = 0;
always @(posedge CAN_logic) begin
    SWr <= {SWr[1:0], SW};
end
wire SW_risingedge = (SWr[2:0]==3'b001);

// output tempolary CAN ID end


parameter RX_SOF	        = 3'b000;
parameter RX_ID_FIELD   	= 3'b001;
parameter RX_STUFF_H	    = 3'b010;
parameter RX_STUFF_L	    = 3'b011;
parameter RX_CONTROL    	= 3'b100;
parameter RX_CONT_STUFF_H	= 3'b101;
parameter RX_CONT_STUFF_L	= 3'b110;
parameter RX_END	    	= 3'b111;

reg [3:0] DLC = 0;
reg [2:0] state = RX_SOF;
reg [2:0] sample = 0;
reg [6:0] bitpos = 0;
reg [4:0] stuffpos = 0;
reg [33:0] scratch;
reg [10:0] sof_buff;
reg [11:0] id_buff;
reg [10:0] temp_buff;

always @(posedge CAN_clk) begin
    case (state)
    RX_SOF: begin
        if (!CAN_logic || sample != 0) sample <= sample + 3'b1;
        if (sample == 3'h3) sof_buff <= {sof_buff[9:0], CAN_logic};
        else if (sample == 3'h7) begin
            state <= RX_ID_FIELD;
            bitpos <= 0;
            stuffpos <= 1; //sof
            sof_buff <= 0;
            sample <= 0;
            scratch <= 0;
        end
    end
    RX_ID_FIELD: begin
        sample <= sample + 3'b1;
        if (sample == 3'h3) begin
            id_buff <= {id_buff[10:0], CAN_logic};
            bitpos <= bitpos + 1;
            stuffpos <= stuffpos + 1;
        end
        else if (stuffpos >= 5 && id_buff[4:0] == 5'b00000 && sample == 3'h4 && bitpos != 11) begin
            sample <= 0;
            state <= RX_STUFF_H;
        end
        else if (stuffpos >= 5 && id_buff[4:0] == 5'b11111 && sample == 3'h4 && bitpos != 11) begin
            sample <= 0;
            state <= RX_STUFF_L;
        end
        else if (bitpos == 11 && sample == 3'h5) begin
            CAN_ID[10:0] <= id_buff[10:0];
            bitpos <= 0;
            sample <= 0;
            state <= RX_CONTROL;
        end
    end
    RX_STUFF_H: begin
        // Synchronization using stuffing bit
        if (CAN_logic || sample != 0) sample <= sample + 3'b1;
        if (sample == 3'h7) begin
            state <= RX_ID_FIELD;
            sample <= 0;
            stuffpos <= 0;
        end
    end
    RX_STUFF_L: begin
        // Synchronization using stuffing bit
        if (!CAN_logic || sample != 0) sample <= sample + 3'b1;
        if (sample == 3'h7) begin
            state <= RX_ID_FIELD;
            sample <= 0;
            stuffpos <= 0;
        end
    end
    RX_CONTROL: begin
        sample <= sample + 3'b1;

        if (sample == 3'h3) begin
            id_buff <= {id_buff[10:0], CAN_logic};
            bitpos <= bitpos + 1;
            stuffpos <= stuffpos + 1;
        end
        
        if (stuffpos >= 5 && id_buff[4:0] == 5'b00000 && sample == 3'h4 && bitpos != 7) begin
            sample <= 0;
            state <= RX_CONT_STUFF_H;
        end
        else if (stuffpos >= 5 && id_buff[4:0] == 5'b11111 && sample == 3'h4 && bitpos != 7) begin
            sample <= 0;
            state <= RX_CONT_STUFF_L;
        end
        else if (bitpos == 7 && sample == 3'h7) begin
            DLC[3:0] = id_buff[3:0];
            id_buff <= 0;
            bitpos <= 0;
            sample <= 0;
            stuffpos <= 0;
            state <= RX_END;
        end
    end
    RX_CONT_STUFF_H: begin
        // Synchronization using stuffing bit
        if (CAN_logic || sample != 0) sample <= sample + 3'b1;
        if (sample == 3'h7) begin
            state <= RX_CONTROL;
            sample <= 0;
            stuffpos <= 0;
        end
    end
    RX_CONT_STUFF_L: begin
        // Synchronization using stuffing bit
        if (!CAN_logic || sample != 0) sample <= sample + 3'b1;
        if (sample == 3'h7) begin
            state <= RX_CONTROL;
            sample <= 0;
            stuffpos <= 0;
        end
    end
    RX_END: begin
        sample <= sample + 3'b1;
        if (sample == 3'h3) sof_buff <= {sof_buff[9:0], CAN_logic};
        //else if (sof_buff[10:0] == 11'b11111111111 && sample == 3'h7) begin
        else if (sof_buff[5:0] == 6'b111111 && sample == 3'h7) begin
            state <= RX_SOF;
            sof_buff <= 0;
            sample <= 0;
            stuffpos <= 0;
            CAN_ID[10:0] <= 0;
        end
    end
endcase
end
        
// measure using clk
reg [11:0] time_counter = 0;
reg [11:0] measure_time = 0;
reg chapture;

always @(posedge CLK) begin
    CANr <= {CANr[1:0], CAN_logic};
    //if (sof_buff[10:0] == 11'b11111111111 && !CAN_logic) chapture <= 1;
    if (state == RX_SOF && !CAN_logic) chapture <= 1;
    if (time_counter >= 3400) begin
        chapture <= 0;
        time_counter = 0;
    end
    if (chapture)
        time_counter = time_counter + 1;
end

always @(posedge CAN_logic) begin
    measure_time[11:0] = time_counter;
end

reg [2:0] CANr;
assign write_request = (CANr[2:1]==2'b01 && chapture);

out_hex out_hex(.CLK(CAN_logic), .data1(CAN_ID), .data2(measure_time), .HEX_5(HEX5), .HEX_4(HEX4), .HEX_3(HEX3), .HEX_2(HEX2), .HEX_1(HEX1), .HEX_0(HEX0));

assign debug1 = (sample == 3'h3);
assign debug2 = (CANr[2:1]==2'b01 && chapture);
assign out_data[26:0] = {CAN_ID[10:0], measure_time[11:0], DLC[3:0]};

endmodule
