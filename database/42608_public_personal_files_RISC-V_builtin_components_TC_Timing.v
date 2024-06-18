// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Timing (en, out);
    parameter UUID = 0;
    parameter NAME = "";
    parameter START_TIME = 0;
    input en;
    output [63:0] out;
    reg [63:0] outval;
    reg [63:0] starttime;
    
    initial begin
        $timeformat(-6, 0, "us", 8);
    end
    
    always begin
        if (en)
            outval = $time + START_TIME;
        else
            outval = {64{1'b0}};
    end
    
    assign out = outval;
endmodule
