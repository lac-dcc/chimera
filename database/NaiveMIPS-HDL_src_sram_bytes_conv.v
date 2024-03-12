`default_nettype none
module bytes_conv(
            input wire clk,
            input wire rst_n,
            input wire[3:0] byteenable_i,
            input wire[31:0] address,
            input wire[31:0] data_ram_rd,
            output reg[31:0] data_ram_wr,
            input wire[31:0] data_master_wr,
            output wire stall_o,
            input wire read_i,
            input wire write_i,
            output reg read_o,
            output reg write_o
);

reg state;
wire[31:0] processed_data;
wire not_word;

assign not_word = (byteenable_i!=4'b1111 && write_i);
assign stall_o = (not_word && !state);
assign processed_data = {
    (byteenable_i[3] ? data_master_wr[31:24] : data_ram_rd[31:24]),
    (byteenable_i[2] ? data_master_wr[23:16] : data_ram_rd[23:16]),
    (byteenable_i[1] ? data_master_wr[15:8] : data_ram_rd[15:8]),
    (byteenable_i[0] ? data_master_wr[7:0] : data_ram_rd[7:0])
};

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        state <= 1'b0;
    end else if(!state && not_word) begin
        state <= 1'b1;
    end else begin
        state <= 1'b0;
    end
end

always @(*) begin
    read_o <= read_i;
    write_o <= write_i;
    data_ram_wr <= data_master_wr;
    if(stall_o) begin
        read_o <= 1'b1;
        write_o <= 1'b0;
    end else if(state) begin
        read_o <= 1'b0;
        write_o <= 1'b1;
        data_ram_wr <= processed_data;
    end
end

endmodule
