counters = document.getElementsByClassName 'counter'
for counter in counters
  counter.onclick = (e) -> e.target.textContent++
