module regfile(
input [7:0] wdata,
input clk,
input we,
input [1:0] waddr,
input [1:0] raddr1,
output [7:0] rdata1,
input [1:0] raddr2,
output [7:0] rdata2
);

reg [7:0] box [0:3];
// Read ports
assign rdata1 = box[raddr1];
assign rdata2 = box[raddr2];
// Write on rising edge of clock
always @(posedge clk) begin
    if (we == 1)
        box[waddr] <= wdata;
end

endmodule
