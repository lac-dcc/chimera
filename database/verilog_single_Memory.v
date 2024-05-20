// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module Memory(ra, wa, we, wd, rd, Memhalf, Membyte, MemExt, clk);
    input [31:0] ra, wa, wd;
    input we, Memhalf, Membyte, MemExt, clk;
    output reg  [31:0] rd;

    reg [7:0] memory [4095:0];

    //大端
    // assign rd[31:24] = (we&&ra==wa)?wd[31:24]:memory[ra[11:0]];
    // assign rd[23:16] = (we&&ra==wa)?wd[23:16]:memory[ra[11:0] + 1];
    // assign rd[15:8] = (we&&ra==wa)?wd[15:8]:memory[ra[11:0] + 2];
    // assign rd[7:0] = (we&&ra==wa)?wd[7:0]:memory[ra[11:0] + 3];



    reg [31:0] ra_;
    always @(ra)
    begin
        if(Memhalf)
        begin
            ra_ = {ra[31:1],1'b0};
            if(MemExt)
            begin
                rd[31:16] = {16{memory[ra_[11:0]][7]}};
                rd[15:8] = memory[ra_[11:0]];
                rd[7:0] = memory[ra_[11:0] + 1];
            end
            else
            begin
                rd[31:16] = 16'b0;
                rd[15:8] = memory[ra_[11:0]];
                rd[7:0] = memory[ra_[11:0] + 1];
            end

        end
        else if(Membyte)
        begin
            if(MemExt)
            begin
                rd[31:8] = {24{memory[ra[11:0]][7]}};
                rd[7:0] = memory[ra[11:0]];
            end
            else
            begin
                rd[31:8] = 24'b0;
                rd[7:0] = memory[ra[11:0]];
            end

        end
        else
        begin
            ra_ = {ra[31:2],2'b0};
            rd[31:24] = memory[ra_[11:0]];
            rd[23:16] = memory[ra_[11:0] + 1];
            rd[15:8] = memory[ra_[11:0] + 2];
            rd[7:0] = memory[ra_[11:0] + 3];
        end
    end



    
    // always @(negedge clk) begin
    //     if (we) begin
    //         memory[wa[11:0]] = wd[31:24];
    //         memory[wa[11:0] + 1] = wd[23:16];
    //         memory[wa[11:0] + 2] = wd[15:8];
    //         memory[wa[11:0] + 3] = wd[7:0];
    //     end
    // end
    reg [31:0] wa_;
    always @(negedge clk) 
    begin
        if (we)
        begin
            if(Memhalf)
            begin
                wa_ = {wa[31:1],1'b0};
                memory[wa_[11:0]] = wd[15:8];
                memory[wa_[11:0] + 1]= wd[7:0];
            end
            else if(Membyte)
            begin
                memory[wa[11:0]] = wd[7:0];
            end
            else
            begin
                wa_ = {wa[31:2],2'b0};
                memory[wa_[11:0]] = wd[31:24];
                memory[wa_[11:0] + 1] = wd[23:16];
                memory[wa_[11:0] + 2] = wd[15:8];
                memory[wa_[11:0] + 3] = wd[7:0];   
            end
        end
    end

    


endmodule
