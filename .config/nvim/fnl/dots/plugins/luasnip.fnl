(module dots.plugins.luasnip
  {autoload {a aniseed.core
             luasnip luasnip}})

(let [t luasnip.text_node
      s luasnip.snippet]
  (luasnip.add_snippets
    :rust
    [(luasnip.snippet "is_prime"
                      [(luasnip.text_node
                         ["fn is_prime(n: usize) -> bool {"
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
                          "fn generate_primes(n: usize) -> impl Iterator<Item = usize> {"
                          "    let mut nums = vec![true; n+1];"
                          "    (3..n).step_by(2).filter_map(move |i| {"
                          "        if nums[i] {"
                          "            ((i+i)..=n).step_by(i).for_each(|n| nums[n] = false);"
                          "            return Some(i)"
                          "        }"
                          "        None"
                          "    })"
                          "}"])])]))
