// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

module ClkCtrl(
    input rst_n,
    input CLKIN_100M,
    input CLKIN_96M,
    
    output CLK_25M,
    output CLK_24M,
    output CLK_48M
);

/*
    cameraClkGen clkgen(
        .CLKIN_100MHz(CLKIN_100MHz),      // IN
        .CLK_25174kHz(CLK_25174kHz),     // OUT
        .CLK_80MHz(CLK_80MHz),     // OUT
        .RESET(!rst_n),// IN
        .LOCKED(clks_valid)
    );      // OUT
*/
    
    reg [1:0] cnt100;
    always @(posedge CLKIN_100M or negedge rst_n) begin
        if (!rst_n) cnt100[1:0] <= 2'h0;
        else cnt100[1:0] <= cnt100[1:0] + 1'b1;
    end
    reg [1:0] cnt96;
    always @(posedge CLKIN_96M or negedge rst_n) begin
        if (!rst_n) cnt96[1:0] <= 2'h0;
        else cnt96[1:0] <= cnt96[1:0] + 1'b1;
    end

    assign CLK_25M = cnt100[1];
    assign CLK_24M = cnt96[1];
    assign CLK_48M = cnt96[0];
    
    

endmodule : ClkCtrl
