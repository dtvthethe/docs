<?php
// Pivot table
namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * class StudentSubject
 *
 * @ORM\Entity
 * @ORM\Table(name="dtb_student_subject")
 * @ORM\InheritanceType("SINGLE_TABLE")
 * @ORM\HasLifecycleCallbacks()
 */
class StudentSubject
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private int $id;

    /**
     * @ORM\ManyToOne(targetEntity="Student", inversedBy="studentStudentSubjects")
     * @ORM\JoinColumn(nullable=false)
     */
    private Student $student;

    /**
     * @ORM\ManyToOne(targetEntity="Subject", inversedBy="subjectStudentSubjects")
     * @ORM\JoinColumn(nullable=false)
     */
    private Subject $subject;

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param  int  $id
     *
     * @return $this
     */
    public function setId(int $id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * @ORM\Column(type="integer")
     */
    private int $score;

    /**
     * @return Student
     */
    public function getStudent()
    {
        return $this->student;
    }

    /**
     * @param  Student  $student
     *
     * @return $this
     */
    public function setStudent(Student $student)
    {
        $this->student = $student;

        return $this;
    }

    /**
     * @return Subject
     */
    public function getSubject()
    {
        return $this->subject;
    }

    /**
     * @param  Subject  $subject
     *
     * @return $this
     */
    public function setSubject(Subject $subject)
    {
        $this->subject = $subject;

        return $this;
    }

    /**
     * @return int
     */
    public function getScore()
    {
        return $this->score;
    }

    /**
     * @param  Score  $score
     *
     * @return $this
     */
    public function setScore(int $score)
    {
        $this->score = $score;

        return $this;
    }
}