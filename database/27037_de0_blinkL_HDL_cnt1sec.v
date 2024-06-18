// This program was cloned from: https://github.com/yukinagata3184/de0_blinkL
// License: MIT License

// Count 1 sec to generate 1Hz.
// author:yukinagata3184

module cnt1sec(
    input CLK, RST,
    output gen1hz
);

// The main clock frequency of DE0 is 50MHz.
reg [25:0] cnt50mhz;

always @(posedge CLK or posedge RST) begin
    if(RST)
        cnt50mhz <= 26'd0;
    else if(gen1hz)
        cnt50mhz <= 26'd0;
    else
        cnt50mhz <= cnt50mhz + 1'b1;
end

assign gen1hz = (cnt50mhz==26'd49_999_999);

endmodule