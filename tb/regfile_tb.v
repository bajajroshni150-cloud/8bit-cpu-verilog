module regfile_tb;

reg [7:0] wdata_tb;
reg clk_tb;
reg we_tb;
reg [1:0] waddr_tb;
reg [1:0] raddr1_tb;
reg [1:0] raddr2_tb;
wire [7:0] rdata1_tb;
wire [7:0] rdata2_tb;
// Design instantiation
regfile my_regfile(
    .wdata(wdata_tb),
    .clk(clk_tb),
    .we(we_tb),
    .waddr(waddr_tb),
    .raddr1(raddr1_tb),
    .rdata1(rdata1_tb),
    .raddr2(raddr2_tb),
    .rdata2(rdata2_tb)
);
// Clock generation
initial clk_tb = 0;
always #5 clk_tb = ~clk_tb;
initial begin
    // Initial values
    wdata_tb = 0;
    we_tb = 0;
    waddr_tb = 0;
    raddr1_tb = 0;
    raddr2_tb = 0;
    // Write 25 into Register 0
    @(negedge clk_tb);
    wdata_tb = 8'd25;
    waddr_tb = 2'b00;
    we_tb = 1;
    @(negedge clk_tb);
    we_tb = 0;
    // Write 50 into Register 1
    @(negedge clk_tb);
    wdata_tb = 8'd50;
    waddr_tb = 2'b01;
    we_tb = 1;
    @(negedge clk_tb);
    we_tb = 0;
    // Read Register 0 and Register 1 simultaneously
    raddr1_tb = 2'b00;
    raddr2_tb = 2'b01;
    #1;
    $display("Register 0 = %d", rdata1_tb);
    $display("Register 1 = %d", rdata2_tb);
  // Write disabled test
@(negedge clk_tb);
wdata_tb = 8'd99;
waddr_tb = 2'b00;
we_tb = 0;

@(posedge clk_tb);
#1;

$display("Register 0 after we=0: %d", rdata1_tb);
    // Finish simulation
    #10;
    $finish;
end

endmodule
