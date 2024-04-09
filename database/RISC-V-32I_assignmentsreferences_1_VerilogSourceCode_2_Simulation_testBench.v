`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB embeded System Lab
// Engineer: Haojun Xia
// Create Date: 2019/02/08
// Design Name: RISCV-Pipline CPU
// Module Name: testBench
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: This testBench Help users to initial the bram content, by loading .data file and .inst file.
//				Then give signals to start the execution of our cpu
//				When all instructions finish their executions, this testBench will dump the Instruction Bram and Data Bram's content to .txt files 
// !!! ALL YOU NEED TO CHANGE IS 4 FILE PATH BELOW !!!	
//				(they are all optional, you can run cpu without change paths here,if files are failed to open, we will not dump the content to .txt and will not try to initial your bram)
//////////////////////////////////////////////////////////////////////////////////
`define DataRamContentLoadPath "F:\\VivadoWorkspace\\RISCV-CPU\\RISCV-CPU.srcs\\sources_1\\new\\SimFiles\\1testAll.data"
`define InstRamContentLoadPath "F:\\VivadoWorkspace\\RISCV-CPU\\RISCV-CPU.srcs\\sources_1\\new\\SimFiles\\1testAll.inst"
`define DataRamContentSavePath "F:\\VivadoWorkspace\\RISCV-CPU\\RISCV-CPU.srcs\\sources_1\\new\\SimFiles\\DataRamContent.txt"
`define InstRamContentSavePath "F:\\VivadoWorkspace\\RISCV-CPU\\RISCV-CPU.srcs\\sources_1\\new\\SimFiles\\InstRamContent.txt"
`define BRAMWORDS 4096  //a word is 32bit, so our bram is 4096*32bit

module testBench(
    );
    //
    reg CPU_CLK;
    reg CPU_RST;
    reg [31:0] CPU_Debug_DataRAM_A2;
    reg [31:0] CPU_Debug_DataRAM_WD2;
    reg [3:0] CPU_Debug_DataRAM_WE2;
    wire [31:0] CPU_Debug_DataRAM_RD2;
    reg [31:0] CPU_Debug_InstRAM_A2;
    reg [31:0] CPU_Debug_InstRAM_WD2;
    reg [3:0] CPU_Debug_InstRAM_WE2;
    wire [31:0] CPU_Debug_InstRAM_RD2;
    //generate clock signal
    always #1 CPU_CLK = ~CPU_CLK;
    // Connect the CPU core
    RV32Core RV32Core1(
        .CPU_CLK(CPU_CLK),
        .CPU_RST(CPU_RST),
        .CPU_Debug_DataRAM_A2(CPU_Debug_DataRAM_A2),
        .CPU_Debug_DataRAM_WD2(CPU_Debug_DataRAM_WD2),
        .CPU_Debug_DataRAM_WE2(CPU_Debug_DataRAM_WE2),
        .CPU_Debug_DataRAM_RD2(CPU_Debug_DataRAM_RD2),
        .CPU_Debug_InstRAM_A2(CPU_Debug_InstRAM_A2),
        .CPU_Debug_InstRAM_WD2(CPU_Debug_InstRAM_WD2),
        .CPU_Debug_InstRAM_WE2(CPU_Debug_InstRAM_WE2),
        .CPU_Debug_InstRAM_RD2(CPU_Debug_InstRAM_RD2)
        );
    //define file handles
    integer LoadDataRamFile;
    integer LoadInstRamFile;
    integer SaveDataRamFile;
    integer SaveInstRamFile;
    //
    integer i;
    //
    initial 
    begin
        $display("Initialing reg values..."); 
        CPU_Debug_DataRAM_WD2 = 32'b0;
        CPU_Debug_DataRAM_WE2 = 4'b0;
        CPU_Debug_InstRAM_WD2 = 32'b0;
        CPU_Debug_InstRAM_WE2 = 4'b0;
        CPU_Debug_DataRAM_A2 = 32'b0;
        CPU_Debug_InstRAM_A2 = 32'b0;
        CPU_CLK=1'b0;
        CPU_RST = 1'b0;
        #10
        
        $display("Loading DataRam Content from file..."); 
        LoadDataRamFile = $fopen(`DataRamContentLoadPath,"r");
        if(LoadDataRamFile==0)
            $display("Failed to Open %s, Do Not Load DataRam values from file!",`DataRamContentLoadPath);
        else    begin  
            CPU_Debug_DataRAM_A2 = 32'h0;     
            $fscanf(LoadDataRamFile,"%h",CPU_Debug_DataRAM_WD2);
            if($feof(LoadDataRamFile))
                CPU_Debug_DataRAM_WE2 = 4'b0;
            else
                CPU_Debug_DataRAM_WE2 = 4'b1111;
            #10
            for(i=0;i<`BRAMWORDS;i=i+1)
            begin
                if($feof(LoadDataRamFile))
                    CPU_Debug_DataRAM_WE2 = 4'b0;
                else
                    CPU_Debug_DataRAM_WE2 = 4'b1111;
                @(negedge CPU_CLK);
                CPU_Debug_DataRAM_A2 = CPU_Debug_DataRAM_A2+4;
                $fscanf(LoadDataRamFile,"%h",CPU_Debug_DataRAM_WD2);
            end
            $fclose(LoadDataRamFile);
        end
        
        $display("Loading InstRam Content from file..."); 
        LoadInstRamFile = $fopen(`InstRamContentLoadPath,"r");
        if(LoadInstRamFile==0)
            $display("Failed to Open %s, Do Not Load InstRam values from file!",`InstRamContentLoadPath);
        else    begin  
            CPU_Debug_InstRAM_A2 = 32'h0;     
            $fscanf(LoadInstRamFile,"%h",CPU_Debug_InstRAM_WD2);
            if($feof(LoadInstRamFile))
                CPU_Debug_InstRAM_WE2 = 4'b0;
            else
                CPU_Debug_InstRAM_WE2 = 4'b1111;
            #10
            for(i=0;i<`BRAMWORDS;i=i+1)
            begin
                if($feof(LoadInstRamFile))
                    CPU_Debug_InstRAM_WE2 = 4'b0;
                else
                    CPU_Debug_InstRAM_WE2 = 4'b1111;
                @(negedge CPU_CLK);
                CPU_Debug_InstRAM_A2 = CPU_Debug_InstRAM_A2+4;
                $fscanf(LoadInstRamFile,"%h",CPU_Debug_InstRAM_WD2);
            end
            $fclose(LoadInstRamFile);
        end
        
        $display("Start Instruction Execution!"); 
        #10;   
        CPU_RST = 1'b1;
        #10;   
        CPU_RST = 1'b0;
        #400000 												// waiting for instruction Execution to End
        $display("Finish Instruction Execution!"); 
        
        $display("Saving DataRam Content to file..."); 
        CPU_Debug_DataRAM_A2 = 32'hfffffffc;
        #10
        SaveDataRamFile = $fopen(`DataRamContentSavePath,"w");
        if(SaveDataRamFile==0)
            $display("Failed to Open %s, Do Not Save DataRam values to file!",`DataRamContentSavePath);
        else
        begin
            $fwrite(SaveDataRamFile,"i\tAddr\tAddr\tData\tData\n");
            #10
            for(i=0;i<`BRAMWORDS;i=i+1)
                begin
                @(posedge CPU_CLK);
                CPU_Debug_DataRAM_A2 = CPU_Debug_DataRAM_A2+4;
                @(posedge CPU_CLK);
                @(negedge CPU_CLK);
                $fwrite(SaveDataRamFile,"%4d\t%8h\t%4d\t%8h\t%4d\n",i,CPU_Debug_DataRAM_A2,CPU_Debug_DataRAM_A2,CPU_Debug_DataRAM_RD2,CPU_Debug_DataRAM_RD2);
                end
            $fclose(SaveDataRamFile);
        end
        
        $display("Saving InstRam Content to file..."); 
        SaveInstRamFile = $fopen(`InstRamContentSavePath,"w");
        if(SaveInstRamFile==0)
            $display("Failed to Open %s, Do Not Save InstRam values to file!",`InstRamContentSavePath);
        else
        begin
            CPU_Debug_InstRAM_A2 = 32'hfffffffc;
            #10
            $fwrite(SaveInstRamFile,"i\tAddr\tAddr\tData\tData\n");
            #10
            for(i=0;i<`BRAMWORDS;i=i+1)
                begin
                @(posedge CPU_CLK);
                CPU_Debug_InstRAM_A2 = CPU_Debug_InstRAM_A2+4;
                @(posedge CPU_CLK);
                @(negedge CPU_CLK);
                $fwrite(SaveInstRamFile,"%4d\t%8h\t%4d\t%8h\t%4d\n",i,CPU_Debug_InstRAM_A2,CPU_Debug_InstRAM_A2,CPU_Debug_InstRAM_RD2,CPU_Debug_InstRAM_RD2);
                end
            $fclose(SaveInstRamFile);      
        end      

        $display("Simulation Ended!"); 
        $stop();
    end
    
endmodule
