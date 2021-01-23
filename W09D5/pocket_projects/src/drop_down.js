
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogLinkCreator = () => {
  let links = [];
  let dogBreeds = Object.keys(dogs);
  dogBreeds.forEach(breed => {
    let dogLink = document.createElement("a");
    dogLink.innerHTML = breed;
    dogLink.href = dogs[breed];
    let dogLi = document.createElement("li");
    dogLi.appendChild(dogLink);
    dogLi.classList.add("dog-link");
    links.push(dogLi);
  });
  return links;
}

const attachDogLinks = () => {
  let links = dogLinkCreator();
  links.forEach(link => {
    document.querySelector(".drop-down-dog-list").appendChild(link);
  });
}

attachDogLinks();

const dogList = document.querySelector(".drop-down-dog-list");
const dogLis = document.querySelectorAll(".dog-link");

const handleEnter = (e) => {
  dogLis.forEach(el => {
    el.classList.toggle("show");
  })
}

const handleLeave = (e) => {
  dogLis.forEach(el => {
    el.classList.toggle("show");
  })
}


dogList.addEventListener("mouseenter", handleEnter);
dogList.addEventListener("mouseleave", handleLeave);