module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A=0,B=1,C=2,D=3;
    reg[1:0] state,next_state;
    always@(*)
        case(state)
            A:next_state<=(x==1)?B:A;
            B:next_state<=(x==1)?D:C;
            C:next_state<=(x==1)?D:C;
            D:next_state<=(x==1)?D:C;
        endcase
    always@(posedge clk,posedge areset)
        begin
            if(areset)
                state<=A;
            else
                state<=next_state;
        end
    assign z=(state==B | state==C)?1:0;

endmodule
