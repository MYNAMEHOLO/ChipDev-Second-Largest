module Second_Largest #(parameter
  DATA_WIDTH = 32
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

  logic [DATA_WIDTH-1:0] largest;
  logic [DATA_WIDTH-1:0] second_largest;

always@(posedge clk )begin
  if(~resetn) begin
    largest <= 'd0;
    second_largest <= 'd0;
  end
  else begin
    if (din >= largest )begin
      largest <= din;
      second_largest <= largest;
    end
    else if(din < largest && din >= second_largest)begin
      second_largest <= din;
    end
  end
end


assign dout = second_largest;
endmodule