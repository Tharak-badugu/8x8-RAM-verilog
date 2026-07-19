`timescale 1ps/1ps
`include "ram_8x8.v"
module tb_ram_8x8;
reg rst,clk,wr_enb,rd_enb;
reg [2:0] wr_address;
reg [2:0] rd_address;
reg [7:0] din;

wire [7:0] out;

ram_8x8 dut(rst,clk,wr_enb,rd_enb,wr_address,rd_address,din,out);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_ram_8x8);
end
initial begin
    clk=0;
    forever #5 clk=~clk;
end
initial begin
    // initializing to zero
rst=1;
wr_enb=0;
rd_enb=0;
wr_address=0;
rd_address=0;
din=0;
//removing rst
#10; 
rst=0;
//performing write operation for loaction 3
#10; 
wr_enb=1;
wr_address=3'd3;
din=8'd150;
//performing read operation for location 5
#10;
wr_address=3'd5;
din=8'd200;
#20;
rd_enb=1;      //trying to read while write,both are high
rd_address=3'd3;
#10;
wr_enb=0;
#10;
//performing read operation for location 5
rd_address=3'd5;
#20;

$finish;
end
endmodule