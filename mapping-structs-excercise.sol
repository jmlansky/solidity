pragma solidity >= 0.7.0 < 0.9.0;

contract Excercise{
    struct Movie {
        string title;
        string director;
    }

    mapping (uint=> Movie) moviesDictionary;
    mapping(address => mapping (uint=> Movie)) addressDictionary;

    function addMovie(uint id, string memory title, string memory director) public {
        moviesDictionary[id] = Movie(title, director);
    }

    function addMovieToAddresses(uint id, string memory title, string memory director) public {
        addressDictionary[msg.sender][id] = Movie(title, director);
    }

    function getMovie(uint id) public view returns(Movie memory){
        return moviesDictionary[id];
    }
}