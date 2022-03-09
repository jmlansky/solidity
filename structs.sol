pragma solidity >= 0.7.0 < 0.9.0;

contract Structs {
    struct Movie {
        string title;
        string director;
        uint id;
    }


    Movie movie;

    function setMovie() public {
        movie = Movie('Blade Runner', 'Ridley Scott', 1);
    }

    function setMovie(string memory title, string memory director, uint id) public {
        movie = Movie(title, director, id);
    }

    function getMovie() public view returns (Movie memory){
        return movie;
    }

}