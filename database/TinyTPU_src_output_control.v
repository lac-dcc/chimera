// This program was cloned from: https://github.com/Revenantx86/TinyTPU
// License: MIT License

module output_control #
(
    parameter D_W = 8,
    parameter N = 2
)
(
    // Global Signal
    input  wire                   clk,
    input  wire                   rst,
    // Systolic Output
    input  wire [(N*N*2*D_W)-1:0] core_out_z,
    input  wire                   init, 
    // IO Output
    output reg                    data_out_z,
    output reg                    tx_ready
);
/*
    STATE Machine
*/
//
localparam IDLE = 1'b0;
localparam TX   = 1'b1;
reg        STATE;
//enum {IDLE,TX} STATE;
//
// Counters
reg [$clog2(2*D_W)-1:0] bit_counter;
reg [$clog2(N)-1:0]     column_counter;
reg [$clog2(N)-1:0]     row_counter;
//
wire [2*D_W-1:0]        data_tx_reg;
//
//
assign data_tx_reg = core_out_z[(row_counter*N + column_counter)*2*D_W +: 2*D_W];
//
reg init_delay [N-1:0];
//
always @(posedge clk) begin
    if(rst) begin
        STATE <= IDLE;
    end
    else begin
        init_delay[0] <= init;
        case(STATE) 
            IDLE: begin
                if(init_delay[N-1])
                    STATE <= TX;
            end
            TX: begin
                if(row_counter == N-1 && column_counter == N-1 && bit_counter == 2*D_W-1) 
                    STATE <= IDLE;
            end
        endcase
    end
end

integer x,r,c;
always @(posedge clk) begin
    //
    if(rst) begin
        //
        bit_counter <= 0;
        column_counter <= 0;
        row_counter <= 0;
        tx_ready <= 0;
        //
    end
    //
    else begin
        case(STATE) 
            IDLE: begin
                //
                bit_counter     <= 0;
                column_counter  <= 0;
                row_counter     <= 0;
                tx_ready        <= 0;
                data_out_z      <= 0;
                //        
            end
            TX: begin
                //
                tx_ready    <= 1;
                bit_counter <= bit_counter + 1;
                data_out_z  <=  data_tx_reg[bit_counter];
                //
                if(bit_counter == (2*D_W-1)) begin
                    column_counter <= column_counter + 1;
                    bit_counter    <= 0;
                end
                if(column_counter == N-1 && bit_counter == (2*D_W-1)) begin
                    column_counter <= 0;
                    row_counter   <= row_counter + 1;
                end
                //
            end
        endcase
    end
end

// Assign delay counter
genvar i;
for (i=1;i<N;i=i+1) begin
    always @(posedge clk) begin
        init_delay[i] <= init_delay[i-1];
    end
end

endmodule