module ram_8x8(input rst,clk,wr_enb,rd_enb,
input [2:0]wr_address,
input [2:0] rd_address,
input [7:0] din,
output reg [7:0]out);

reg [7:0]mem[7:0];
integer i;
//write operation
always@(posedge clk or posedge rst) begin
    if(rst) begin
        for (i=0; i<8; i=i+1)begin
            mem[i]<=0;
        end
    end

    else if(wr_enb) begin
            mem[wr_address]<=din;
        end
end
//read operation
always@(posedge clk or posedge rst) begin
    if(rst) begin
        out<=0;
    end
    else if(rd_enb) begin
        out<=mem[rd_address];
    end
end
endmodule
            
