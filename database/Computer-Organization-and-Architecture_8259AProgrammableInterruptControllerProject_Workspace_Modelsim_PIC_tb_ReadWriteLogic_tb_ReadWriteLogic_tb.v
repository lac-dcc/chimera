// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/*
    testbench for ReadWriteLogic module and cover its corner case
*/
module ReadWriteLogic_tb;
    reg Read;
    reg write;
    reg A0;
    reg CS;
    reg [7:0]dataBuffer;

    wire write_flag; // done
    wire [7:0]ICW1;
    wire [7:0]ICW2;
    wire [7:0]ICW3;
    wire [7:0]ICW4;
    wire [7:0]OCW1;
    wire [7:0]OCW2;
    wire [7:0]OCW3;
    wire read_cmd_to_ctrl_logic;
    wire read_cmd_imr_to_ctrl_logic;
    wire read_flag;
    wire OCW2_change;
    

    ReadWriteLogic readWriteLogic(.Read(Read),.write(write),.A0(A0),.CS(CS),.dataBuffer(dataBuffer),
    .write_flag(write_flag),.ICW1(ICW1),.ICW2(ICW2),.ICW3(ICW3),.ICW4(ICW4),.OCW1(OCW1),.OCW2(OCW2),.OCW3(OCW3),
    .read_cmd_to_ctrl_logic(read_cmd_to_ctrl_logic),.OCW2_change(OCW2_change),.read_cmd_imr_to_ctrl_logic(read_cmd_imr_to_ctrl_logic),
    .read_flag(read_flag));
    

    initial begin
        //ICW1
        write = 1;
        CS =0;
        A0 = 0;
        Read = 1;
        dataBuffer = 8'b00010001;
        #100;
        write = 0;
        CS =0;
        A0 = 0;
        Read = 1;
        dataBuffer = 8'b00010001;
//ICW2
        #100;
        write = 1;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b00010111;
        #100;
        write = 0;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b00010111;
//ICW3

        #100;
        write = 1;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b00010111;
        #100;
        write = 0;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b00010111;

//ICW4
        #100;
        write = 1;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b00010111;
        #100;
        write = 0;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b00010111;

// OCW1
        #100;
        write = 1;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b01010101;
        #100;
        write = 0;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b01010101;

// OCW2        
        #100;
        write = 1;
        CS =0;
        A0 = 0;
        Read = 1;
        dataBuffer = 8'b10000111;
        #100;
        write = 0;
        CS =0;
        A0 = 0;
        Read = 1;
        dataBuffer = 8'b10000111;
        #100;
// OCW3
        write = 1;
        CS =0;
        A0 = 0;
        Read = 1;
        dataBuffer = 8'b11101111;
        #100;
        write = 0;
        CS =0;
        A0 = 0;
        Read = 1;
        dataBuffer = 8'b11101111;
        #100;

        //OCW1
        write = 1;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b11101111;
        #100;
        write = 0;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b11101111;
        #100;

        //OCW3
        write = 1;
        CS =0;
        A0 = 0;
        Read = 1;
        dataBuffer = 8'b00101111;
        #100;
        write = 0;
        CS =0;
        A0 = 0;
        Read = 1;
        dataBuffer = 8'b00101111;
        #100;

        
        // OCW2        
        
        write = 1;
        CS =0;
        A0 = 0;
        Read = 1;
        dataBuffer = 8'b11100111;
        #100;
        write = 0;
        CS =0;
        A0 = 0;
        Read = 1;
        dataBuffer = 8'b11100111;
        #100;
        //////////////////////////////////////////////////////////////////
        // test Reading operations isr || irr //
        write = 1;
        CS =0;
        A0 = 0;
        Read = 1;
        dataBuffer = 8'b11100111;
        #100;
        write = 1;
        CS =0;
        A0 = 0;
        Read = 0;
        dataBuffer = 8'b11100111;
        #100;

        // read imr
        write = 1;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b11100111;
        #100;
        write = 1;
        CS =0;
        A0 = 1;
        Read = 0;
        dataBuffer = 8'b11100111;
        #100;

        write = 1;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b11100111;
        #100;
        write = 1;
        CS =0;
        A0 = 1;
        Read = 0;
        dataBuffer = 8'b11100111;
        #100;

        // 
        //////////////////////////////////////////////////////////////////
        // test write flag and read flag //
        // active read
        write = 1;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b11100111;
        #100;
        write = 1;
        CS =0;
        A0 = 1;
        Read = 0;
        dataBuffer = 8'b11100111;
        #100;
        // active write
        write = 1;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b11100111;
        #100;
        write = 0;
        CS =0;
        A0 = 1;
        Read = 1;
        dataBuffer = 8'b11100111;
        #100;
    end
endmodule
