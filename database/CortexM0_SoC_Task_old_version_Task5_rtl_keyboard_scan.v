// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module keyboard_scan(
    input                clk,
    input                rstn,
    input        [3 :0]  col,
    output  reg  [3 :0]  row = 4'b1110,
    output  reg  [15:0]  key  
);

reg [31:0] cnt;
reg scan_clk;

always@(posedge clk) begin
    if (!rstn) begin
        cnt <= 0;
        scan_clk <= 1'b0;
    end else begin
        if(cnt == 2499) begin
            cnt <= 0;
            scan_clk <= ~scan_clk;
        end else begin
            cnt <= cnt + 1;
        end         
    end

end

always@(posedge scan_clk) begin
    row <= {row[2:0],row[3]}; 
end
    
always@(negedge scan_clk) begin
    case(row)
        4'b1110 : key[3:0] <= col;
        4'b1101 : key[7:4] <= col;
        4'b1011 : key[11:8] <= col;
        4'b0111 : key[15:12] <= col;
        default : key <= 0;
    endcase
end

endmodule
      

