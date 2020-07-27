quicksort = arr => {
  if (arr.length <= 1) return arr;
  const [head, ...tail] = arr;
  const smaller = quicksort(tail.filter(n => n <= head));
  const larger = quicksort(tail.filter(n => n > head));
  return [...smaller, head, ...larger];
};

// #haskell
//
// Une fois qu’on goûte au fonctionnel… difficile d’en revenir.
//
// S’approprier un nouveau paradigme, c’est aussi complètement revoir la manière de penser le code.
//
// J’ai l’impression que des nouveaux cablâges de neurones se sont mis en place,
