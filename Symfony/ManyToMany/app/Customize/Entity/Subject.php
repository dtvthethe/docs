<?php

namespace Customize\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * class Subject
 *
 * @ORM\Table(name="dtb_subject")
 * @ORM\InheritanceType("SINGLE_TABLE")
 * @ORM\DiscriminatorColumn(name="discriminator_type", type="string", length=255)
 * @ORM\HasLifecycleCallbacks()
 * @ORM\Entity(repositoryClass="Customize\Repository\SubjectRepository")
 */
class Subject
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private int $id;

    /**
     * @ORM\Column(name="name", type="string", length=255)
     */
    private string $name;

    /**
     * @ORM\OneToMany(targetEntity="StudentSubject", mappedBy="subject", fetch="EXTRA_LAZY")
     */
    private $subjectStudentSubjects;

    public function __construct()
    {
        $this->subjectStudentSubjects = new ArrayCollection();
    }

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
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param  string  $name
     *
     * @return $this
     */
    public function setName(string $name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection|Student[]
     */
    public function getStudents(): Collection
    {
        return $this->subjectStudentSubjects;
    }

    public function addStudent(Student $student): self
    {
        if (!$this->subjectStudentSubjects->contains($student)) {
            $this->subjectStudentSubjects[] = $student;
            $student->addSubject($this);
        }

        return $this;
    }

    public function removeStudent(Student $student): self
    {
        if ($this->subjectStudentSubjects->removeElement($student)) {
            $student->removeSubject($this);
        }

        return $this;
    }
}