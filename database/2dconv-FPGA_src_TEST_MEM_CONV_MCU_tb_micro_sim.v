// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`define GPIO_D 32

module micro_sim_tb();
    
    parameter GPIO_D        = `GPIO_D;
    parameter N = 4;
    parameter IMG_SIZE = 439;
    localparam PATH = "/home/ivan/XilinxProjects/2dconv-FPGA/src/TEST/MEM_CONV_MCU/";
    localparam FILENAME = "mem0";
    localparam OUTFNAME = "out_mem0";

    
    wire [GPIO_D-1:0] gpio_i_data_tri_i;
    wire              o_led;
    reg               CLK100MHZ;
    wire [GPIO_D-1:0] gpio_o_data_tri_o;


    reg [23:0]       i_GPIOdata;
    reg [2:0]        i_GPIOctrl;
    reg              i_GPIOvalid;
    reg              rst;

    integer           i, j, k, aux, aux_name;
    integer           file[0:N+1];

    assign gpio_o_data_tri_o = {i_GPIOctrl,i_GPIOvalid, 3'b0, i_GPIOdata, rst};
    
    initial begin

        CLK100MHZ = 1'b0;
        i_GPIOdata = 24'b0;
        i_GPIOctrl = 3'b0;
        i_GPIOvalid = 1'b0;
        rst = 1'b0;

        //RESET
        #100 rst = 1'b1;
        #100 rst = 1'b0;

        //CARGO KERNEL
        #200 i_GPIOctrl = 3'b000;

        i_GPIOdata = 24'h002000;
        #100 i_GPIOvalid = 1'b1;
        #100 i_GPIOvalid = 1'b0;
        
        #100 i_GPIOdata = 24'h208020;
        #100 i_GPIOvalid = 1'b1;
        #100 i_GPIOvalid = 1'b0;

        #100 i_GPIOdata = 24'h002000;
        #100 i_GPIOvalid = 1'b1;
        #100 i_GPIOvalid = 1'b0;

        //CARGO IMAGE LENGTH
        #500 i_GPIOctrl = 3'b001;
        i_GPIOdata = IMG_SIZE;
        
        for(k = 0; k < 2; k = k+1) begin
            if(k == 0)
                aux = N+2;
            else
                aux = N;           
            
            //CARGO IMAGEN EN MEMORIA
            #500 i_GPIOctrl = 3'b010;
            for (j = 0; j < aux; j = j+1) begin
                if(k == 0)
                    file[j] = $fopen({PATH, FILENAME+j,".txt"}, "r");
                else
                    file[j] = $fopen({PATH, FILENAME+N+2+j+aux*(k-1),".txt"}, "r");

                if(!file[j]) begin
                    $display("Error abriendo archivo");
                    $stop;
                end else begin
                    for (i = 0; i <= IMG_SIZE; i = i+1) begin
                        if(i == IMG_SIZE && j == aux-1)
                            #100 i_GPIOctrl = 100; //ultimo dato a cargar
                        #100 $fscanf(file[j], "%h", i_GPIOdata);
                        #100 i_GPIOvalid = 1'b1;
                        #100 i_GPIOvalid = 1'b0;
                    end
                end
            end
            for (j = 0; j < N+2; j = j+1) begin
                $fclose(file[j]);
            end
            
            wait(o_led);
            #100 i_GPIOctrl = 011;
            for (j = 0; j < N; j = j+1) begin
                file[j] = $fopen({PATH, OUTFNAME+j+k*N,".txt"}, "w");
            end
            j = 0;
            for (i = 0; i < N*(IMG_SIZE-1); i = i+1) begin
                if (i % (IMG_SIZE-1) == 0 && i > IMG_SIZE-2) begin
                    j = j+1;
                    $display("Paso a memoria %d", j);
                end
                $fwrite(file[j], "%h\n", gpio_i_data_tri_i[12:0]);
                #100 i_GPIOvalid = 1'b1;
                #100 i_GPIOvalid = 1'b0;

            end
            for (j = 0; j < N; j = j+1) begin
                $fclose(file[j]);
            end
        end
        $finish;
    end

    always #2 CLK100MHZ = ~CLK100MHZ;

    micro_sim#(.N(N))
        u_micro
            (
             .gpio_o_data_tri_o(gpio_o_data_tri_o),
             .gpio_i_data_tri_i(gpio_i_data_tri_i),
             .o_led(o_led),
             .CLK100MHZ(CLK100MHZ)
             );
    

endmodule
