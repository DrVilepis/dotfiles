(module dots.plugins.luasnip
  {autoload {a aniseed.core
             luasnip luasnip}})

(let [t luasnip.text_node
      s luasnip.snippet]
  (luasnip.add_snippets 
    :rust
    [(luasnip.snippet "readints"
                      [(luasnip.text_node 
                         ["#[macro_export]"
                          "macro_rules! readints {"
                          "    ($x:ident,$y:ident) => {{"
                          "        $x.read_line(&mut $y).unwrap();"
                          "        let nums = $y"
                          "            .trim()"
                          "            .split_whitespace()"
                          "            .map(|s| s.parse::<i32>().unwrap())"
                          "            .collect::<Vec<_>>();"
                          "        $y.clear();"
                          "        nums"
                          "    }};"
                          "}"])])
     (luasnip.snippet "is_prime"
                      [(luasnip.text_node 
                         ["fn is_prime<T: Into<i64>>(n: T) -> bool {"
                          "    let n: i64 = n.into();"
                          "    match n {"
                          "        1 => false,"
                          "        2 | 3 => true,"
                          "        n if n % 2 == 0 => false,"
                          "        n => !(3..)"
                          "            .step_by(2)"
                          "            .take_while(|i| i * i <= n)"
                          "            .any(|i| n % i == 0),"
                          "    }"
                          "}"])])
     (luasnip.snippet "generate_primes"
                      [(luasnip.text_node 
                         [
                          "fn generate_primes(n: usize) -> Vec<usize> {"
                          "    let mut nums = vec![true; n];"
                          "    (2..n).step_by(2).for_each(|n| nums[n] = false);"
                          "    let mut primes = vec![2];"
                          "    (3..nums.len()).fold(2, |mut p, i| {"
                          "        if nums[i] {"
                          "            primes.push(i);"
                          "            p = i * i;"
                          "            (p..n).step_by(p).for_each(|n| nums[n] = false);"
                          "        }"
                          "        p"
                          "    });"
                          "    primes"
                          "}" ])])
     (luasnip.snippet "mainstdin"
                      [(luasnip.text_node
                         ["fn main() {"
                          "    let mut stdin = std::io::stdin();"
                          "    let mut input = String::new();"
                          "    stdin.read_line(&mut input).unwrap();"
                          "}"])])]))
