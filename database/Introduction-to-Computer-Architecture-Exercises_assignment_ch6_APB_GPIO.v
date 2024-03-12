module APB_GPIO # (
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 8,
    parameter GPIO_WIDTH = 8,
    parameter GPIO_DATA_ADDR = 8'h_f0,
    parameter GPIO_CONF_ADDR = 8'h_f1
) (
    input                    pclk,
    input                    presetn,
    input  [ADDR_WIDTH -1:0] paddr,
    input                    psel,
    input                    penable,
    input                    pwrite,
    output [DATA_WIDTH -1:0] prdata,
    input  [DATA_WIDTH -1:0] pwdata,

    input  [GPIO_WIDTH -1:0] gpio_in,
    output [GPIO_WIDTH -1:0] gpio_out,
    output [GPIO_WIDTH -1:0] gpio_out_en
);

    wire do_read;
    wire do_write;

    reg  [DATA_WIDTH -1:0] prdata_r;

    reg  [GPIO_WIDTH -1:0] gpio_config;
    reg  [GPIO_WIDTH -1:0] gpio_data;

    wire rw_data;
    wire rw_conf;

    assign gpio_out = gpio_data;
    assign gpio_out_en = gpio_config;

    assign do_read = psel && !penable && !pwrite;
    assign do_write = psel && penable && pwrite;

    assign prdata = prdata_r;
    always @ (posedge pclk) begin
        if (!presetn) begin
            prdata_r <= {DATA_WIDTH{1'b0}};
        end else if (do_read) begin
            if (paddr == GPIO_DATA_ADDR) begin
                prdata_r <= gpio_data;
            end else if (paddr == GPIO_CONF_ADDR) begin
                prdata_r <= gpio_config;
            end else begin
                prdata_r <= {DATA_WIDTH{1'b0}};
            end
        end
    end

    always @ (posedge pclk) begin
        if (!presetn) begin
            gpio_config <= {GPIO_WIDTH{1'b0}};
        end else if (do_write && paddr == GPIO_CONF_ADDR) begin
            gpio_config <= pwdata;
        end
    end

    always @ (posedge pclk) begin
        if (!presetn) begin
            gpio_data <= {GPIO_WIDTH{1'b0}};
        end else if (do_write && paddr == GPIO_DATA_ADDR) begin
            gpio_data <= (~gpio_config & gpio_in) | (gpio_config & pwdata);
        end else begin
            gpio_data <= (~gpio_config & gpio_in) | (gpio_config & gpio_data);
        end
    end


endmodule;