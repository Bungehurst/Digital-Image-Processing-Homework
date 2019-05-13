function mark = Fcc(i,j,a,mark,mk)
    if(i>2 && j>2)
        if(a(i,j) == 1)
            if(a(i,j-1) == 0 && a(i-1,j) == 0)
                if(mark(i,j) == 0)
                    mk = mk+1;
                    mark(i,j) = mk;
                end
            elseif(a(i,j-1) == 0 && a(i-1,j) ~= 0)
                if(mark(i,j) == 0)
                    mark(i,j) = mark(i-1,j);
                else
                    if(mark(i-1,j) > mark(i,j))
                        mark(i-1,j) = mark(i,j);
                        Fcc(i-1,j,a,mark,mk);
                    end
                end
            elseif(a(i,j-1)~= 0 && a(i-1,j) == 0)  
                if(mark(i,j) == 0)
                    mark(i,j) = mark(i,j-1);
                else
                    if(mark(i,j-1) > mark(i,j))
                        mark(i,j-1) = mark(i,j);
                        Fcc(i,j-1,a,mark,mk);
                    end
                end
            end
            elseif(a(i,j-1) ~= 0 && a(i-1,j) == 0 && mark(i,j-1) == mark(i-1,j)) 
                if(mark(i,j) == 0)
                    mark(i,j) = mark(i,j-1);
                else
                    if(mark(i,j-1) > mark(i,j))
                        mark(i,j-1) = mark(i,j);
                        mark(i-1,j) = mark(i,j);
                        Fcc(i-1,j-1,a,mark,mk);
                    end
                end
            elseif(a(i,j-1) ~=0 && a(i-1,j) == 0 && mark(i,j-1) ~= mark(i-1,j))
                mark(i,j) = min(mark(i,j-1),mark(i-1,j));
                mark(i-1,j) = mark(i,j);
                mark(i,j-1) = mark(i,j);
                Fcc(i-1,j-1,a,mark,mk);
        else
            Fcc(i-1,j-1,a,mark,mk);
        end
    end
end