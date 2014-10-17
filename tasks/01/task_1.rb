def series(row_type, index)
  case row_type
    when 'fibonacci' then row_element(1, 1, index)
    when 'lucas' then row_element(2, 1, index)
    when 'summed' then row_element(3, 2, index)
  end
end

def row_element(first, second, index)
  return first if index == 1
  return second if index == 2

  row_element(first, second, index - 1) + row_element(first, second, index - 2)
end
