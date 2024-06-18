// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module Memory(ra, rb, wa, we, wd, qa, qb, Memhalf, Membyte, MemExt, clk);
    input [31:0] ra, rb, wa, wd;
    input we, Memhalf, Membyte, MemExt, clk;
    output reg  [31:0] qa, qb;

    reg [7:0] memory [4095:0];

    reg [31:0] DataSegment = 32'h0;
    reg [31:0] CodeSegment = 32'h0;



    //大端

    //双端读取

    //ra qa 指令读取
    reg [31:0] ra_;
    always @(ra)
    begin
        ra_ = ra + CodeSegment;
        ra_ = {ra_[31:2],2'b0};
        qa[31:24] = memory[ra_[11:0]];
        qa[23:16] = memory[ra_[11:0] + 1];
        qa[15:8] = memory[ra_[11:0] + 2];
        qa[7:0] = memory[ra_[11:0] + 3];
    end


    //rb qb 数据读取
    reg [31:0] rb_;
    always @(rb, posedge clk)
    begin
        rb_ = rb + DataSegment;
        if(Memhalf)
        begin
            rb_ = {rb_[31:1],1'b0};
            if(MemExt)
            begin
                qb[31:16] = {16{memory[rb_[11:0]][7]}};
                qb[15:8] = memory[rb_[11:0]];
                qb[7:0] = memory[rb_[11:0] + 1];
            end
            else
            begin
                qb[31:16] = 16'b0;
                qb[15:8] = memory[rb_[11:0]];
                qb[7:0] = memory[rb_[11:0] + 1];
            end

        end
        else if(Membyte)
        begin
            if(MemExt)
            begin
                qb[31:8] = {24{memory[rb_[11:0]][7]}};
                qb[7:0] = memory[rb_[11:0]];
            end
            else
            begin
                qb[31:8] = 24'b0;
                qb[7:0] = memory[rb_[11:0]];
            end

        end
        else
        begin
            rb_ = {rb_[31:2],2'b0};
            qb[31:24] = memory[rb_[11:0]];
            qb[23:16] = memory[rb_[11:0] + 1];
            qb[15:8] = memory[rb_[11:0] + 2];
            qb[7:0] = memory[rb_[11:0] + 3];
        end
    end




    


    reg [31:0] wa_;
    always @(negedge clk) 
    begin
        if (we)
        begin
            wa_ = wa + DataSegment;
            if(Memhalf)
            begin
                wa_ = {wa_[31:1],1'b0};
                memory[wa_[11:0]] = wd[15:8];
                memory[wa_[11:0] + 1]= wd[7:0];
            end
            else if(Membyte)
            begin
                memory[wa_[11:0]] = wd[7:0];
            end
            else
            begin
                wa_ = {wa_[31:2],2'b0};
                memory[wa_[11:0]] = wd[31:24];
                memory[wa_[11:0] + 1] = wd[23:16];
                memory[wa_[11:0] + 2] = wd[15:8];
                memory[wa_[11:0] + 3] = wd[7:0];   
            end
        end
    end

    
endmodule

